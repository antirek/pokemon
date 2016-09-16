pokemon = (name, link, options)->
  if name and link
    html = '<div class="pokemonBlock">
              <a href="@pokemonHref" target="_blank">
                <div id="@pokemonId">
                  <img src="pokemons/@pokemonName.gif">
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
                right: @pokemonRight;                
                white-space: nowrap !important;
                z-index: 1000000 !important;
            }'

    css = css
    .replace '@pokemonId', id
    .replace '@pokemonTop', options.top || '300px'
    .replace '@pokemonRight', options.right || '10px'
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
