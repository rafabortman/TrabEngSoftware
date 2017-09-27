class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  def hello
render html: '<h1>Welcome to<a style="color:GoldenRod"> Speedfy</a></h1>
<h2>Our pages:</h2>
	<ul>
			<li><a href="/jogadas">jogadas</a></li>
			<li><a href="/jogos">jogos</a></li>
			<li><a href="/amigos">amigos</a></li>
			<li><a href="/usuarios">usuarios</a></li>
			<li><a href="/buscar">Buscar usuarios</a></li>
			<li><a href="/home">home</a></li>
</ul>

'.html_safe
end

end
