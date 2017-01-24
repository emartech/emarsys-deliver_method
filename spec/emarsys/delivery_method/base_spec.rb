require 'spec_helper'
require 'mail'

RSpec.describe Emarsys::DeliveryMethod::Base do
  describe 'deliver!' do
    let(:mail) do
      m = Mail.new do
        to 'to-one@emar.sys,to-two@emar.sys'
        from 'from@emar.sys'
        text_part do
          body 'This is plain text'
        end
        html_part do
          content_type 'text/html; charset=UTF-8'
          body '<h1>This is HTML</h1>'
        end
      end
      m.subject = 'This is subject'
      m.header['X-EMS-Customer-Id'] = 123

      m
    end

    it 'should call emarsys api to send the email' do
      expected_params = {
        recipients: [
          { email: 'to-one@emar.sys' },
          { email: 'to-two@emar.sys' }
        ],
        from: 'from@emar.sys',
        subject: 'This is subject',
        text_body: 'This is plain text',
        html_body: '<h1>This is HTML</h1>'
      }
      expect_any_instance_of(Emarsys::Api::Services).to receive(:email_queue).with('123', expected_params)

      subject.deliver!(mail)
    end

    it 'should handle if mail sent to only one address' do
      expected_params = {
        recipients: [
          { email: 'to-one@emar.sys' }
        ],
        from: 'from@emar.sys',
        subject: 'This is subject',
        text_body: 'This is plain text',
        html_body: '<h1>This is HTML</h1>'
      }
      expect_any_instance_of(Emarsys::Api::Services).to receive(:email_queue).with('123', expected_params)
      mail.to = 'to-one@emar.sys'

      subject.deliver!(mail)
    end
  end
end
