const addSecondaryFabric = () => {  
    // Method to replace content of for and id tag in template (see new.html.erb file for clothes)
    const insertForAndIdTag = (index, field) => {
      return `clothe_technical_details_attributes_${index}_${field}`;
    } 

    // Method to replace content of name tag in template (see new.html.erb file for clothes)
    const insertNameTag = (index, field) => {
      return `clothe[technical_details_attributes][${index}][${field}]`;
    }
  
    // Select the add-secondary-fabric button
    const addComponentButtons = document.querySelectorAll('#add-component');  
    
    // Define a counter to be incremented. It begins at 6 because of the id of the by default forms
    let counter = 6;

    addComponentButtons.forEach( (addComponentButton) => {
      addComponentButton.addEventListener('click', (event) => {
        // Select HTML template (see new.html.erb file for clothes)
        const originTemplate = document.querySelector(event.currentTarget.dataset.target);
        console.log(originTemplate.parentNode);
  
        const template = document.importNode(originTemplate.content, true);
        // Select label tags in the template
        const labels = template.querySelectorAll('label');
    
        // Select select tag to find id and name tag in the template
        const selects = template.querySelectorAll('select');
        const inputs = template.querySelectorAll('input');
    
        // Replace content of for, id and name tags by the newIndex thanks to the insertxxxTag methods
        labels[0].attributes.for.value = insertForAndIdTag(counter, 'component');
        labels[1].attributes.for.value = insertForAndIdTag(counter, 'quantity');
        selects[0].attributes.id.value = insertForAndIdTag(counter, 'component');
        inputs[0].attributes.id.value = insertForAndIdTag(counter, 'quantity');
        selects[0].attributes.name.value = insertNameTag(counter, 'component');
        inputs[0].attributes.name.value = insertNameTag(counter, 'quantity');
        counter += 1;
        originTemplate.parentNode.appendChild(template);
      });
    });
}

export { addSecondaryFabric };


