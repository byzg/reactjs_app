//= require_tree ./components

currentName = prompt('Как вас звать?', '');
React.render(<Chat pollInterval='3000' url='/messages' currentName={currentName}/>, document.getElementById('container'));



