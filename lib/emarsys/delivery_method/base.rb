module Emarsys
  module DeliveryMethod
    class Base
      def initialize(_options = {})
      end


      def deliver!(mail)
        ::Emarsys::Api::Services.new.email_queue get_customer(mail), build_params(mail)
      end


      private

      def get_customer(mail)
        mail.header['x-ems-customer-id'].to_s
      end


      def build_params(mail)
        {
          to: mail.to.join(','),
          from: mail.from.first,
          subject: mail.subject,
          text_body: mail.text_part.decoded,
          html_body: mail.html_part.decoded
        }
      end
    end
  end
end
