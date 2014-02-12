require "spec_helper"

describe ContactAdmin do
  describe "emailAdmin" do
    let(:mail) { ContactAdmin.emailAdmin }

    it "renders the headers" do
      mail.subject.should eq("Emailadmin")
      mail.to.should eq(["to@example.org"])
      mail.from.should eq(["from@example.com"])
    end

    it "renders the body" do
      mail.body.encoded.should match("Hi")
    end
  end

end
