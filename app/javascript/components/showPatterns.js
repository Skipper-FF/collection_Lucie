const showPatterns = () => {

    const familyFields = document.querySelectorAll('input[name="clothe[family]"]');
    familyFields.forEach( (familyField) => {
      familyField.addEventListener( 'change', (event) => {
        if (event.currentTarget.checked) {
            const familyValue = event.currentTarget.value;
            const url = `/patterns?id=${familyValue}`;
            console.log(url);
            fetch(url, { headers: { accept: "application/json" } })
            .then(response => response.json())
            .then((data) => {
              const patternsContainer = document.querySelector('#pattern-fieldset');
              patternsContainer.innerHTML = data.html;
            });
        };


      });
    });
}

export { showPatterns };

// #new_clothe > fieldset > div:nth-child(3)