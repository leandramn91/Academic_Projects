function validate()
      {
	  var pattern = /^[A-Za-z0-9 ]+$/; 

if( document.myForm.title.value == "" )
         {
            alert( "Please provide the title!" );
            document.myForm.title.focus() ;
            return false;
         }
		 
		 
		 
		 if( document.myForm.size.value == "" )
         {
            alert( "Please provide the size of video!" );
            document.myForm.size.focus() ;
            return false;
         }
		 
		 if( document.myForm.type.value == "" )
         {
            alert( "Please provide the type of video!" );
            document.myForm.type.focus() ;
            return false;
         }
		 
		 if( document.myForm.proficiency.value == "" )
         {
            alert( "Please provide the proficiency!" );
            document.myForm.proficiency.focus() ;
            return false;
         }
		 
		 
		 
		 if( document.myForm.experience.value == "" )
         {
            alert( "Please provide your domain experience!" );
            document.myForm.experience.focus() ;
            return false;
         }
		 
		 
		 
		 if( document.myForm.uploadVideo.value == "" )
         {
            alert( "Please upload the video!" );
            document.myForm.uploadVideo.focus() ;
            return false;
         }
		 
		 if( document.myForm.uploadTranscript.value == "" )
         {
            alert( "Please upload the transcript!" );
            document.myForm.uploadTranscript.focus() ;
            return false;
         }
			if(!document.myForm.title.value.match(pattern))  
			{
			   alert('Please write proper title!');  
				myForm.title.focus();  
				return false;  
			}  

			if(!document.myForm.duration.value.match(pattern))  
			{
			   alert('Please write proper duration!');  
				myForm.duration.focus();  
				return false;  
			}  

			if(!document.myForm.size.value.match(pattern))  
			{
			   alert('Please write proper size!');  
				myForm.size.focus();  
				return false;  
			}  

			if(!document.myForm.type.value.match(pattern))  
			{
			   alert('Please write proper type!');  
				myForm.type.focus();  
				return false;  
			}  

			if(!document.myForm.proficiency.value.match(pattern))  
			{
			   alert('Please write proper proficiency!');  
				myForm.proficiency.focus();  
				return false;  
			}  

			if(!document.myForm.experience.value.match(pattern))  
			{
			   alert('Please write proper experience!');  
				myForm.experience.focus();  
				return false;  
			}  
			
		 	 
		   return( true );
		   }