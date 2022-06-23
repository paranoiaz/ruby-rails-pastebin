class PastesController < ApplicationController

  # HTTP GET
  def index()

  end

  # HTTP GET
  def list()
    @pastes = Paste.all()
  end

  # HTTP GET
  def new()
    
  end

  # HTTP POST
  def create()
    # keep generating random strings till unique
    endpoint = get_random_string()
    while Paste.exists?(endpoint: endpoint) do
      endpoint = get_random_string()
    end
    
    @paste = Paste.new(endpoint: endpoint, content: params[:content])
    if @paste.valid?
      @paste.save
      redirect_to(action: "show", id: @paste.endpoint)
    else
      redirect_to(action: "index")
    end
  end

  # HTTP GET
  def show()
    @paste = Paste.find_by(endpoint: params[:id])

    if @paste.nil?
      redirect_to(action: "index")
    end
  end

  # HTTP GET
  def raw()
    @paste = Paste.find_by(endpoint: params[:id])

    if !@paste.nil?
      render(:layout => false)
    else
      redirect_to(action: "index")      
    end
  end

  private
    # return random string with only lowercase letters
    def get_random_string()
      return [*("a"..."z")].sample(PastesHelper::KEY_LIMIT).join()
    end
end