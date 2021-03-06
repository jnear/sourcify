require File.join(File.expand_path(File.dirname(__FILE__)), 'spec_helper')

describe "Method#to_source (from def ... end block)" do
  describe "w nested method" do

    should 'handle simple' do
      def m1
        def aa; x = 1; end
      end
      method(:m1).should.be having_source(%(
        def m1
          def aa; x = 1; end
        end
      ))
    end

    should 'handle nested' do
      def m2
        def aa
          def bb; x = 2; end
        end
      end
      method(:m2).should.be having_source(%(
        def m2
          def aa
            def bb; x = 2; end
          end
        end
      ))
    end

  end
end
