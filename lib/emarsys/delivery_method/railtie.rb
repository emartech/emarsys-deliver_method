module Emarsys
  module DeliveryMethod
    class Railtie < Rails::Railtie
      initializer 'emarsys-delivery_method.add_delivery_method' do
        ActiveSupport.on_load :action_mailer do
          ActionMailer::Base.add_delivery_method :emarsys, ::Emarsys::DeliveryMethod::Base
        end
      end
    end
  end
end
