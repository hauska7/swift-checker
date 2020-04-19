require 'net/http'
require 'json'

class SwiftChecker
  def initialize(watcher = nil)
    puts "warning: it is best practice to provide a watcher in production"
    @watcher = watcher
  end

  def validate(swift)
    previous_validation = fetch_cached(swift)

    if previous_validation
      result = build("validation_result", previous_validation)
      return result
    end

    response = post("api/v1/validate_swift", { swift: swift })

    if success?(response)
      data = parse_json(response.body)
      notify_human(data["notify_human_info"])

      result = build("validation_result", data)
      cache(swift, result)
      result
    elsif response.is_a?(StandardError)
      raise response
    else fail
    end
  end

  def fetch_cached(swift)
    # todo
  end

  def cache(swift, validation)
    # todo
  end

  def success?(response)
    if response.is_a?(StandardError)
      false
    else
      response.code == "200"
    end
  end

  def post(path, data)
    uri = URI("http://hidden-oasis-93800.herokuapp.com/#{path}")
    Net::HTTP.post_form(uri, data)
  rescue StandardError => e
    e
  end

  def handle_error(e)
    raise e if e.is_a?(StandardError)
  end

  def parse_json(json)
    ::JSON.parse(json)
  end

  def build(what, a = nil)
    case what
    when "validation_result"
      result = a

      def result.valid?
        self["validation_status"]
      end

      unless result.valid?
        def result.errors
          self["errors"]
        end

        def result.error_messages
          self["errors"].map { |error| error["message"] }
        end
      end
      result
    else fail
    end
  end

  def notify_human(info)
    if info
      if @watcher
        watcher.notify_human(info)
      else
        puts "Hello, Human your attention is required! #{info}"
      end
    end
  end
end

