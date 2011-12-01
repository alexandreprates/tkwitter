class Tkwitter::GUI
  
  def initialize(&block)
    @messages=[]
    @root = TkRoot.new(:title => 'Twitter Searcher')
    @text_var = TkVariable.new
    make_screen(&block)
  end

  def populate(options = {})
    wrapper = TkFrame.new(@content, :width => 300).pack(:fill => 'x', :pady => 2, :padx => 2)
    TkLabel.new(wrapper, :image => TkPhotoImage.new(:file => options[:image_filename])).grid(:column => 0, :row => 0, :rowspan => 2)
    TkLabel.new(wrapper, :text => options[:name], :foreground => '#6d6d6d').grid(:column => 1, :row => 0)
    TkLabel.new(wrapper, :text => options[:date], :foreground => '#6d6d6d').grid(:column => 2, :row => 0)
    TkLabel.new(wrapper, :text => options[:text], :wraplength => 380).grid(:column => 1, :row => 1, :columnspan => 2)
    @messages << wrapper
    Tk.update
  end

  def clean_search
    @messages.collect(&:unpack)
    @messages.clear
    @text_var.value = ''
  end
  
  def text
    @text_var.value
  end

  def run
    Tk.mainloop
  end
  
  private 

  def make_screen(&block)
    TkLabel.new(@root, :text => 'Digite o texto da pesquisa:').grid(:column => 0, :row => 0)
    TkEntry.new(@root, :textvariable => @text_var, :width => 35).grid(:column => 0, :row => 1)
    TkButton.new(@root, :text => 'Pesquisar', :command => block).grid(:column => 1, :row => 1)
    @content = TkFrame.new(@root, :background => '#dddddd', :width => 400, :height => 100).grid(:column => 0, :row => 2, :columnspan => 2, :padx => 5, :pady => 5)
  end
  
end