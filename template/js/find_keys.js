
function find_key() {
    const title = document.title;
            var tokenId;
            const match = title.match(/^\d+/);
        
            if (match) {
                tokenId = parseInt(match[0], 10);
            } else return;
        
            var cleanTitle = title.replace(/\s|\||ä|ö|\:|\d/g, '').toLowerCase();
        
        
            var symbolString = '';
            var symbolCount = 6;
            
            for (var i = 0; i < symbolCount; i++) {
                var index = (parseInt(tokenId) + i) % cleanTitle.length;
            
                var newIndex = (index + parseInt(tokenId) + i + 1) % cleanTitle.length;
                while (symbolString.includes(cleanTitle.charAt(newIndex))) {
                newIndex = (newIndex + 1) % cleanTitle.length;
                }
            
                symbolString += cleanTitle.charAt(newIndex);
            }
        
            var lastSymbol = symbolString.charAt(symbolString.length - 1);
            var numberValue = lastSymbol.charCodeAt(0) % cleanTitle.length;
            symbolString = symbolString.slice(0, symbolString.length - 1) + numberValue;
            console.log(symbolString)
}