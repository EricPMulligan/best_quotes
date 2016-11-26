class QuotesController < Rulers::Controller
  def a_quote
    @noun = :winking
  end

  def exception
    raise "It's a bad one!"
  end

  def index
    @quotes = FileModel.all
  end

  def quote_1
    @obj = FileModel.find(1)
    render :quote
  end

  def new_quote
    attrs = {
      'submitter' => 'web user',
      'quote' => 'A picture is worth one k pixels',
      'attribution' => 'Me'
    }
    @obj = FileModel.create attrs
    render :quote
  end

  def update
    raise 'Invalid request method' unless request.post?
    @obj = FileModel.save(1, request.params)
    render :quote
  end

  def show
    @obj = FileModel.find(params['id'])
    @ua = request.user_agent
    render :quote
  end
end
