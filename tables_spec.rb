# encoding: utf-8
require File.expand_path("../spec_helper", __FILE__)

describe "Tables" do

  before :each do
    browser.goto(WatirSpec.url_for("tables.html"))
  end

  bug "http://github.com/jarib/celerity/issues#issue/25", :celerity do
    describe "with selectors" do
      it "returns the matching elements" do
        expect(browser.tables(rules: "groups").to_a).to eq [browser.table(rules: "groups")]
      end
    end
  end

  describe "#length" do
    it "returns the number of tables" do
      expect(browser.tables.length).to eq 4
    end
  end

  describe "#[]" do
    it "returns the p at the given index" do
      expect(browser.tables[0].id).to eq "axis_example"
      expect(browser.tables[1].id).to eq "outer"
      expect(browser.tables[2].id).to eq "inner"
    end
  end

  describe "#each" do
    it "iterates through tables correctly" do
      count = 0

      browser.tables.each_with_index do |t, index|
        expect(t.id).to eq browser.table(index: index).id
        count += 1
      end

      expect(count).to be > 0
    end
  end

end
