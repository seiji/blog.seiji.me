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

desc "build"
task :build do |t|
  %x(bundle exec jekyll build)
end

desc "Clean _sites and rebuild"
task :clean do |t|
  %x(rm -Rf _site/* && bundle exec jekyll build)
end

desc "Preview"
task :preview do
  %x(bundle exec jekyll serve)
end

desc "Preview Draft"
task :draft do
  %x(bundle exec jekyll serve --drafts)
end

desc "Watch"
task :watch do
  %x(bundle exec jekyll serve --watch)
end

