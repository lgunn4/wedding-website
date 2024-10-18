module SqidsEncodable
    extend ActiveSupport::Concern
  
    SQIDS = Sqids.new(min_length: 8)
  
    def to_param
      sqid
    end
  
    def sqid
      SQIDS.encode([id])
    end
  
    class_methods do
      def find_by_sqid(sqid)
        find(SQIDS.decode(sqid).first)
      end
    end
  end