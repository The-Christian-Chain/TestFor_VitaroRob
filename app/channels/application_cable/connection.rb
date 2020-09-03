module ApplicationCable
    class Connection < ActionCable::Connection::Base
      identified_by :current_member
  
      def connect
        self.current_member = find_verified_member
        logger.add_tags 'ActionCable says: Current Member email is ', current_member.email
        logger.add_tags 'ActionCable says: Current Member ID is ', current_member.id
      end
  
      protected
  
      def find_verified_member
        if verified_member = env['warden'].user
          verified_member
        end
      end
    end
  end
  