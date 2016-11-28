class QuotesController < Rulers::Controller
  def a_quote
    noun = :winking
    render :a_quote,  noun: noun
  end

  def exception
    raise "It's a bad one!"
  end

  def index
    quotes = FileModel.all
    render :index,  quotes: quotes
  end

  def quote_1
    obj = FileModel.find(1)
    render :quote,  obj: obj
  end

  def new_quote
    attrs = {
      'submitter' => 'web user',
      'quote' => 'A picture is worth one k pixels',
      'attribution' => 'Me'
    }
    obj = FileModel.create attrs
    render :quote,  obj: obj
  end

  def update
    raise 'Invalid request method' unless request.post?
    obj = FileModel.save(1, request.params)
    render :quote,  obj: obj
  end

  def show
    obj = FileModel.find(params['id'])
    ua = request.user_agent
    render :quote,  obj: obj, ua: ua
  end
end
