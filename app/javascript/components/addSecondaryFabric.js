const addSecondaryFabric = () => {
    console.log('Hello');
    const addSecondaryFabricButton = document.querySelector('#add_secondary-fabric');

    addSecondaryFabricButton.addEventListener('click', (event) => {
    console.log(event);
    });
}

export { addSecondaryFabric };

