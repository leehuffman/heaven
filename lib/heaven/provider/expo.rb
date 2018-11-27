 module Heaven
  module Provider
    class Expo < DefaultProvider
      def initialize(guid, payload)
        super
        @name = "expo"
      end

      def execute
        return execute_and_log(["/usr/bin/true"]) if Rails.env.test?

        unless File.exist?(checkout_directory)
          log "Cloning #{repository_url} into #{checkout_directory}"
          execute_and_log(["git", "clone", clone_url, checkout_directory])
        end

        Dir.chdir(checkout_directory) do
          log "Fetching the latest code"
          execute_and_log(%w{git fetch})
          execute_and_log(["git", "reset", "--hard", sha])

          File.write("deployment.json", deployment_data.to_json)

          yarn_install_string = ["yarn", "install", "--ignore-optional", "--non-interactive"]
          log "Attempting yarn install..."
          execute_and_log(yarn_install_string)

          expo_login_string = ["expo", "login", "-u", "#{ENV.fetch('EXPO_USERNAME')}", "-p", "#{ENV.fetch('EXPO_PASSWORD')}"]
          log "Attempting Expo CLI login..."
          execute_and_log(expo_login_string)

          expo_release_string = "yarn publish:#{environment}"
          log "Executing expo release: #{expo_release_string}"
          execute_and_log(expo_release_string)
        end
      end
    end
  end
 end