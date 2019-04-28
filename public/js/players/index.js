let idPlayer;

$(".picture").click(function () {
    idPlayer=$(this).attr("id").split("_")[1];
    $("#image").attr("src",$(this).attr("src"));
    $("#pictureModal").foundation("open");
    defineCropper();
    return false;

});

$("#save").click(function () {
    let options = {"width":400 , "height":700};
    let result = $image.cropper("getCroppedCanvas", options, options);


    $.ajax({
        type:"POST",
        url: path + "player/saveImage/"+idPlayer,
        data:"picture=" + result.toDataURL(),
        success:function (backFromServer) {
            if(backFromServer==="Ok"){
                $("#player_"+idPlayer).attr("src",result.toDataURL());
                $("#pictureModal").foundation("close");
            }else{
                alert(backFromServer);
            }

        }

    });

    return false;
});

let $image;

function defineCropper(){


    let URL = window.URL || window.webkitURL;
    $image = $('#image');
    let options = {aspectRatio: 4 / 5 };

// Cropper
    $image.on({}).cropper(options);

    let uploadedImageURL;


// Import image
    let $inputImage = $('#inputImage');

    if (URL) {
        $inputImage.change(function () {
            let files = this.files;
            let file;

            if (!$image.data('cropper')) {
                return;
            }

            if (files && files.length) {
                file = files[0];

                if (/^image\/\w+$/.test(file.type)) {


                    if (uploadedImageURL) {
                        URL.revokeObjectURL(uploadedImageURL);
                    }

                    uploadedImageURL = URL.createObjectURL(file);
                    $image.cropper('destroy').attr('src', uploadedImageURL).cropper(options);
                    $inputImage.val('');
                } else {
                    window.alert('Please choose an image file.');
                }
            }
        });
    } else {
        $inputImage.prop('disabled', true).parent().addClass('disabled');
    }

}