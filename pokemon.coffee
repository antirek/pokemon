pokemon = (name, link, options)->
  pokemonsList = [
      'pikachu', 'aerodactyl', 
      'alakazam', 'bulbasaur', 
      'charmander'
    ]

  if !name
    name = pokemonsList[Math.floor(Math.random() * pokemonsList.length)];

  if name and link
    html = '<div class="pokemonBlock">
              <a href="@pokemonHref" target="_blank">
                <div id="@pokemonId">
                  <img src="https://antirek.github.io/pokemon/pokemons/@pokemonName.gif">
                </div>
              </a>
            </div>'

    if !options
      options = {}

    if options and options.id
      id = options.id
    else
      id = "pokemon" + Date.now()
    css = '
            #@pokemonId {
                position: fixed !important;
                top: @pokemonTop;
                left: @pokemonLeft;
                right: @pokemonRight;
                bottom: @pokemonBottom;
                z-index: 1000000 !important;
            }'

    css = css
      .replace '@pokemonId', id
      .replace '@pokemonTop', options.top || ''
      .replace '@pokemonLeft', options.left || ''
      .replace '@pokemonRight', options.right || ''
      .replace '@pokemonBottom', options.bottom || ''


    style = document.createElement "style"
    style.setAttribute 'type', 'text/css'

    style.appendChild document.createTextNode css
    document.body.appendChild style

    component = document.createElement "div"
    html = html
      .replace '@pokemonHref', link
      .replace '@pokemonId', id
      .replace '@pokemonName', name || 'pikachu'

    component.innerHTML = html
    document.body.appendChild component