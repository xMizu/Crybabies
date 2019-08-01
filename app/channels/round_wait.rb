class RoundWaitChannel < ApplicationCable::Channel  
    def finished?
        stream_from 'round'
    end

    def score_page
        if @round.finished?
            ActionCable.server.broadcast "hello"
        end    
    end
end  