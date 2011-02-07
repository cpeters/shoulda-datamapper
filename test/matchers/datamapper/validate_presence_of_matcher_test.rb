require 'test_helper'

class ValidatePresenceOfMatcherTest < ShouldaDataMapperTest # :nodoc:

  context "a required attribute" do
    setup do
      @model = define_model :example do
        property :attr, String
        validates_presence_of :attr
      end.new
    end

    should "require a value" do
      assert_accepts validate_presence_of(:attr), @model
    end

    should "not override the default message with a blank" do
      assert_accepts validate_presence_of(:attr).with_message(nil), @model
    end
  end

  context "an optional attribute" do
    setup do
      @model = define_model :example do
        property :attr, String
      end.new
    end

    should "not require a value" do
      assert_rejects validate_presence_of(:attr), @model
    end
  end

  context "a required has_many association" do
    setup do
      define_model :child
      @model = define_model :parent do
        has n, :children
        validates_presence_of :children
      end.new
    end

    should "require the attribute to be set" do
      assert_accepts validate_presence_of(:children), @model
    end
  end

  context "an optional has_many association" do
    setup do
      define_model :child
      @model = define_model :parent do
        has n, :children
      end.new
    end

    should "not require the attribute to be set" do
      assert_rejects validate_presence_of(:children), @model
    end
  end

  context "a required has_and_belongs_to_many association" do
    setup do
      define_model :child
      @model = define_model :parent do
        has n, :children
        validates_presence_of :children
      end.new
    end

    should "require the attribute to be set" do
      assert_accepts validate_presence_of(:children), @model
    end
  end

  context "an optional has_and_belongs_to_many association" do
    setup do
      define_model :child
      @model = define_model :parent do
        has n, :children
      end.new
    end

    should "not require the attribute to be set" do
      assert_rejects validate_presence_of(:children), @model
    end
  end

end
