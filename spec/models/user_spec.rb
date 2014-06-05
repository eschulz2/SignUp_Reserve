require "spec_helper"

require 'rails_helper'


describe User do

  user = User.new(first_name: "Eric", last_name: "Schulz", email: "eric@eric.com", password: "tomato")

  context "has names" do

    it "a first name" do
      expect(user.first_name).to eq "Eric"
    end

    it "a last name" do
      expect(user.last_name).to eq "Schulz"
    end

    it "a full name" do
      expect(user.name).to eq "Eric Schulz"
    end

  end

  context "has credits" do

    it "begins with 1 credit" do
      expect(user.credit).to eq 1
    end

    it "and can be given more credits" do
      user.add_credit
      expect(user.credit).to eq 2
      user.add_credit
      expect(user.credit).to eq 3
    end

    it "that can be deducted" do
      user.deduct_credit
      expect(user.credit).to eq 2
    end

    it "and knows when it has credits" do
      expect(user.has_credits?).to eq true
    end

    it "and knows when it does not have credits" do
      user.deduct_credit 
      user.deduct_credit     
      expect(user.has_credits?).to eq false
    end


  end

  context "has event create priviledges status" do

    it "by default does not have event creation privileges" do
      expect(user.create_privileges).to eq false
      expect(user.can_create_events?).to eq false
    end

    it "can gain can gain event creation privileges" do
      user.create_privileges = true
      expect(user.create_privileges).to eq true
      expect(user.can_create_events?).to eq true
    end

  end

  context "can have seats" do

    it "and be without any seats" do
      expect(user.seats).to eq []
    end

    it "and can be assigned seats" do
      seat1 = Seat.new
      seat2 = Seat.new
      user.seats << seat1
      expect(user.seats).to eq [seat1]
      user.seats << seat2
      expect(user.seats).to eq [seat1, seat2]
    end

  end
end