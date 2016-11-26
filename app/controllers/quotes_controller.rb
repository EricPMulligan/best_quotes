class QuotesController < Rulers::Controller
  def a_quote
    render :a_quote, noun: :winking
  end

  def exception
    raise "It's a bad one!"
  end

  def index
    quotes = FileModel.all
    render :index, quotes: quotes
  end

  def quote_1
    quote_1 = FileModel.find(1)
    render :quote, obj: quote_1
  end

  def new_quote
    attrs = {
      'submitter' => 'web user',
      'quote' => 'A picture is worth one k pixels',
      'attribution' => 'Me'
    }
    m = FileModel.create attrs
    render :quote, obj: m
  end

  def update
    raise 'Invalid request method' unless request.post?
    m = FileModel.save(1, request.params)
    render :quote, obj: m
  end

  def method_missing(m, *args, &block)

  end
end
