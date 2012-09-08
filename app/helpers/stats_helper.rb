module StatsHelper
  def stats_helper(&blk)
    hooks_array = Array.new
      
    hooks = Helpers::Hooks.new(hooks_array)
    hooks.instance_eval(&blk)
      
    hooks_js = hooks_array.map do |h|
      Helpers.mwp_register_hook(h[:scope], h[:event])
    end.join("\n")
      
    session[:session_id] ?
      Helpers.format_hook_js(session[:session_id], hooks_js) :
      nil
  end
  
private
  
  module Helpers
    class Hooks
      def initialize(hooks)
        @hooks = hooks
      end

      def hook(scope, event)
        @hooks << { scope: scope, event: event }
      end
    end
  
    def self.format_hook_js(session_id, hooks_js)
      session_id = Digest::MD5.hexdigest(session_id)
      %Q{
        <script type="text/javascript" charset="utf-8">
          (function() {
            jQuery(function() {
              MwpEventRegister.setSessionId('#{session_id}');
              #{hooks_js}
            });
          }).call(this);
        </script>
      }.gsub("\n", "").gsub(/\s+/, ' ').html_safe
    end
    
    def self.mwp_register_hook(scope, event)
      "MwpEventRegister.hook('#{scope}', '#{event}');"
    end
  end
    
end
