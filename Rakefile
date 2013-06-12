require 'liquid'

PATH_TEMPLATE_POST="_templates/post.md"

Dir['_rake/*.rake'].each { |r| load r }

desc "Create new post"
task :new_post, [:title] do |t, args|
  title = args[:title]
  raise "\e[31mMissing post title!\e[0m" unless title

  template = Liquid::Template.parse(File.new(PATH_TEMPLATE_POST).read)

  file_name = title.gsub(/ /, "-")
  file_name = file_name.gsub(/[^A-Za-z\-]/, "")

  date = Date::today.to_s
  File.open("_posts/#{date}-#{file_name}.md", 'w') do |f|
    f.write(template.render(
                            'title' => title,
                            'date'  => date,
                            ))
  end
end

desc "build"
task :build do |t|
  Rake::Task["haml"].invoke
  %x(bundle exec jekyll build)
end

desc "Clean _sites and rebuild"
task :clean do |t|
  %x(rm -Rf _site/*)
  Rake::Task["build"].invoke
end

desc "Preview"
task :preview do
  Rake::Task["haml"].invoke
  %x(bundle exec jekyll serve)
end

desc "Preview Draft"
task :draft do
  Rake::Task["haml"].invoke
  %x(bundle exec jekyll serve --drafts)
end

desc "Watch"
task :watch do
  Rake::Task["haml"].invoke
  %x(bundle exec jekyll serve --watch)
end

desc "haml layouts"
task :haml do
  %w(_layouts _includes).each do |dir|
    system(%{
      cd #{dir}/haml &&
      for f in *.haml; do [ -e $f ] && haml $f ../${f%.haml}.html; done
    })
  end
end
