module Resource

  def check(element)
    true_elements = %w[GET POST PUT DELETE q]
    tf = true
    unless true_elements.include?(element)
      puts "Ошибка! Не извесная команда"
      tf = false
    end
    tf
  end

  def check_get(element)
    true_elements = %w[index show q]
    tf = true
    unless true_elements.include?(element)
      puts "Ошибка! Не извесная команда"
      tf = false
    end
    tf
  end

  def connection(routes)
    if routes.nil?
      puts "No route matches for #{self}"
      return
    end

    loop do
      print 'Choose verb to interact with resources (GET/POST/PUT/DELETE) / q to exit: '
      verb = gets.chomp
      next unless check(verb)

      break if verb == 'q'

      action = nil

      if verb == 'GET'
        loop do
          print 'Choose action (index/show) / q to exit: '
          action = gets.chomp
          next unless check_get(action)
          break if action == 'q'
        end
        break if action == 'q'
      end


      action.nil? ? routes[verb].call : routes[verb][action].call
    end
  end
end

class PostsController
  extend Resource

  def initialize
    @posts = []
  end

  def index
    @posts.each.with_index do |post, index |
      puts "id: #{index+1} #{post}"
    end
  end

  def show
    puts "Type index of the post: "
    id = gets.to_i

    if id > 0
      puts "id: #{id} #{@posts[id-1]}"
    else
      puts "Wrong id, must be  higher than zero"
    end
  end

  def create
    puts "Type text of the post"
    post_text = gets.chomp
    @posts.push(post_text)
    puts "Post: #{post_text}\n id: #{@posts.find_index(post_text)+1}"
  end

  def update
    puts "Type index of the post"
    id = gets.to_i
    puts "Enter new text: "
    new_text = gets.chomp
    @posts[id-1] = new_text
    index
  end

  def destroy
    puts "Enter index of destroying post:"
    id = gets.to_i
    @posts.delete_at(id-1)
  end
end

class CommentsController
  extend Resource

  def initialize
    @comments = []
  end

  def index
    @comments.each.with_index do |comment, index|
      puts "id: #{index+1} #{comment}"
    end
  end

  def show
    puts "Type index of the comment: "
    id = gets.to_i
    if id > 0
      puts "id: #{id} #{@comments[id-1]}"
    else
      puts "Wrong id, must be  higher than zero"
    end

  end

  def create
    puts "Type text of the comment"
    comment_text = gets
    @comments.push(comment_text)
    puts "Comment: #{comment_text}\n id: #{@comments.find_index(comment_text)+1}"
  end

  def update
    puts "Type index of the comment:"
    id = gets.to_i
    puts "Enter new text: "
    new_text = gets.chomp
    @comments[id-1] = new_text
    index
  end

  def destroy
    puts "Enter index of destroying comment:"
    id = gets.to_i
    @comments.delete_at(id-1)
  end
end

class Router
  def initialize
    @routes = {}
  end

  def check(element)
    true_elements = %w[1 2 q]
    tf = true
    unless true_elements.include?(element)
      puts "Ошибка! Не извесная команда"
      tf = false
    end
    tf
  end

  def init
    resources(PostsController, 'posts')
    resources(CommentsController, 'comments')

    loop do
      print 'Choose resource you want to interact (1 - Posts, 2 - Comments, q - Exit): '
      choise = gets.chomp
      next unless check(choise)

      PostsController.connection(@routes['posts']) if choise == '1'
      CommentsController.connection(@routes['comments']) if choise == '2'
      break if choise == 'q'
    end

    puts 'Good bye!'
  end

  def resources(klass, keyword)
    controller = klass.new
    @routes[keyword] = {
      'GET' => {
        'index' => controller.method(:index),
        'show' => controller.method(:show)
      },
      'POST' => controller.method(:create),
      'PUT' => controller.method(:update),
      'DELETE' => controller.method(:destroy)
    }
  end
end

router = Router.new

router.init