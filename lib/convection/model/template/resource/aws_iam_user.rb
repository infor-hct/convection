require_relative '../resource'

module Convection
  module DSL
    ## Add DSL method to template namespace
    module Template
      def iam_user(name, &block)
        r = Model::Template::Resource::IAMUser.new(name, self)

        r.instance_exec(&block) if block
        resources[name] = r
      end
    end
  end

  module Model
    class Template
      class Resource
        ##
        # AWS::IAM::User
        ##
        class IAMUser < Resource
          property :path, 'Path'
          property :login_profile, 'LoginProfile'
          property :group, 'Groups', :array
          property :policy, 'Policies', :array

          def initialize(*args)
            super
            type 'AWS::IAM::User'
          end
        end
      end
    end
  end
end
