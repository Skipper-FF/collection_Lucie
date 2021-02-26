const addSecondaryFabric = () => {
    console.log('Hello');
    const addSecondaryFabricButton = document.querySelector('#add-secondary-fabric');
    const form = document.querySelector('#form-add-secondary-fabric');
      console.log(form);
    const secondaryForms = document.querySelector('#secondary-forms');
    const labels = form.querySelectorAll('label');
      console.log(labels);
      console.log(labels[0].attributes);
      console.log(labels[0].attributes.for.value);
    const selects = form.querySelectorAll('select');
      console.log(selects);
      console.log(selects[0].attributes);
      console.log(selects[0].attributes.id.value);
      console.log(selects[0].attributes.name.value);

    addSecondaryFabricButton.addEventListener('click', (event) => {
      secondaryForms.insertAdjacentHTML( 'beforeend', form.innerHTML);
    });
}


export { addSecondaryFabric };

