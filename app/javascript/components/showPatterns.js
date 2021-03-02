const showPatterns = () => {

    const fetchElements = (url, containerId) => {
        fetch(url, { headers: { accept: "application/json" } })
            .then(response => response.json())
            .then((data) => {
              const container = document.querySelector(containerId);
              container.innerHTML = data.html;
            });
    } 

    const familyFields = document.querySelectorAll('input[name="clothe[family]"]');
    familyFields.forEach( (familyField) => {
      familyField.addEventListener( 'change', (event) => {
        if (event.currentTarget.checked) {
            const familyValue = event.currentTarget.value;
            const patternsUrl = `/patterns?id=${familyValue}`;
            const factoriesUrl = `/factories?id=${familyValue}`;
            fetchElements(patternsUrl, '#pattern-fieldset');
            fetchElements(factoriesUrl, '#factory-fieldset');
        };
      });
    });
}

export { showPatterns };
