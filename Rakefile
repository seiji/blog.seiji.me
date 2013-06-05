require 'liquid'

PATH_TEMPLATE_POST="_templates/post.md"

desc "Create new post"
task :new_post, [:title] do |t, args|
  title = args[:title]
  raise "\e[31mMissing post title!\e[0m" unless title

  template = Liquid::Template.parse(File.new(PATH_TEMPLATE_POST).read)
  # TODO: sanitize title
  date = Date::today.to_s
  File.open("_posts/#{date}-#{title}.md", 'w') do |f|
    f.write(template.render(
                            'title' => title,
                            'date'  => date,
                            ))
  end
end
