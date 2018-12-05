module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition in web_steps.rb
  #


  def path_to(page_name)
    case page_name

    when /^new task$/
      '/users/1/tasks/new'
    when /^create$/
      '/users/new'
    when /^login$/
      '/users/login'
    when /the edit page for "(.*)"$/
      edit_movie_path(Movie.where("title=?",$1).first)

    when /index$/
      '/users'

    when /^auth$/
      "/users/authenticate"

    when /^dashboard&/
      "/users"
    else
      begin
        page_name =~ /^the (.*) page$/
        path_components = $1.split(/\s+/)
        self.send(path_components.push('path').join('_').to_sym)
      rescue NoMethodError, ArgumentError
        raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
          "Now, go and add a mapping in #{__FILE__}"
      end
    end
  end
end

World(NavigationHelpers)
