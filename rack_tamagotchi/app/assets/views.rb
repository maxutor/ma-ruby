module Views
  require "erb"

  def self.all_pets(pets)
    template = ERB.new <<-EOF
      <html>
        <style>
          li {
            font-size: 16pt
           }
        </style>
        <body>
          <h2>List of all pets</h2>
          <ul>
            <% pets.each do |pet| %>
              <li><%= pet.name %></li>
            <% end %>
          </ul>
        </body>
      </html>
    EOF
    template.result(binding)
  end

  def self.one_pet(pet)
    template = ERB.new <<-EOF
      <html>
        <style>
          li {
            font-size: 16pt
           }
        </style>
        <body>
          <h2><%= pet.name %> characteristics</h2>
          <ul>
            <li>Mood: <%= pet.mood %></li>
            <li>Hunger: <%= pet.hunger %></li>
            <li>Health: <%= pet.health %></li>
            <li>Is alive?: <%= pet.is_alive %></li>
          </ul>
        </body>
      </html>
    EOF
    template.result(binding)
  end

  def self.dead_pet(name)
    template = ERB.new <<-EOF
      <html>
        <body>
          <h2 align="center"><%= name %> is dead</h2>
          <h3 align="center">Try again, create new pet</h3>
          <div align=center><img src="https://scontent-cdg2-1.cdninstagram.com/v/t51.2885-15/e35/75551315_1422791647895913_2161968055762361370_n.jpg?_nc_ht=scontent-cdg2-1.cdninstagram.com&_nc_cat=109&_nc_ohc=enwr2mcVtv4AX-Wik9b&oh=510e3cc1f6bb77b3bc5f0de26e24936a&oe=5E76ED4F&ig_cache_key=MjE4NzI5OTEyMjE1NTMwNTk2Ng%3D%3D.2"></div>
        </body>
      </html>
    EOF
    template.result(binding)
  end
end
