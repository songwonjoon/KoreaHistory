ClassicEditor 

    .create( document.querySelector('#hcontent' ) ) 

    .then( editor => { 

        console.log( editor );
       
    } ) 

    .catch( error => { 

        console.error( error ); 

    } );
