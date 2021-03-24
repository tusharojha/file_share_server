const homeHTML = """

<html>

<head>
    <title>File Share Platform in Dart</title>
    <style>
        @import url(https://fonts.googleapis.com/css?family=Lato:400,700,300);

        body {
            font-family: "Lato", sans-serif;
        }

        .container {
            position: absolute;
            top: 0;
            right: 0;
            bottom: 0;
            left: 0;
            -webkit-box-align: center;
            -moz-box-align: center;
            box-align: center;
            -webkit-align-items: center;
            -moz-align-items: center;
            -ms-align-items: center;
            -o-align-items: center;
            align-items: center;
            -ms-flex-align: center;
            display: -webkit-box;
            display: -moz-box;
            display: box;
            display: -webkit-flex;
            display: -moz-flex;
            display: -ms-flexbox;
            display: flex;
            -webkit-box-pack: center;
            -moz-box-pack: center;
            box-pack: center;
            -webkit-justify-content: center;
            -moz-justify-content: center;
            -ms-justify-content: center;
            -o-justify-content: center;
            justify-content: center;
            -ms-flex-pack: center;
            background-color: #bf7a6b;
            background-image: -webkit-linear-gradient(bottom left, #bf7a6b 0%, #e6d8a7 100%);
            background-image: linear-gradient(to top right, #bf7a6b 0%, #e6d8a7 100%);
            flex-direction: column;
        }

        .form {
            width: 400px;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
        }

        .file-upload-wrapper {
            position: relative;
            width: 100%;
            height: 60px;
        }

        .file-upload-wrapper:after {
            content: attr(data-text);
            font-size: 18px;
            position: absolute;
            top: 0;
            left: 0;
            background: #fff;
            padding: 10px 15px;
            display: block;
            width: calc(100% - 40px);
            pointer-events: none;
            z-index: 20;
            height: 40px;
            line-height: 40px;
            color: #999;
            border-radius: 5px 10px 10px 5px;
            font-weight: 300;
        }

        .file-upload-wrapper:before {
            content: "Upload";
            position: absolute;
            top: 0;
            right: 0;
            display: inline-block;
            height: 60px;
            background: #4daf7c;
            color: #fff;
            font-weight: 700;
            z-index: 25;
            font-size: 16px;
            line-height: 60px;
            padding: 0 15px;
            text-transform: uppercase;
            pointer-events: none;
            border-radius: 0 5px 5px 0;
        }

        .file-upload-wrapper:hover:before {
            background: #3d8c63;
        }

        .file-upload-wrapper input {
            opacity: 0;
            position: absolute;
            top: 0;
            right: 0;
            bottom: 0;
            left: 0;
            z-index: 99;
            height: 40px;
            margin: 0;
            padding: 0;
            display: block;
            cursor: pointer;
            width: 100%;
        }

        .container h1 {
            color: #fff;
        }

        .text-input {
            font-family: "Lato", sans-serif;
            border-radius: 5px;
            border-width: 0px;
            margin-top: 5px;
            text-align: center;
            font-size: 18;
        }

        .btn {
            height: 60px;
            background: #4daf7c;
            color: #fff;
            font-weight: 700;
            z-index: 25;
            font-size: 16px;
            line-height: 60px;
            padding: 0 15px;
            text-transform: uppercase;
            border-radius: 0 5px 5px 0;
            border-width: 0;
            margin-top: 5px;
            width: 100%;
        }
    </style>
</head>

<body>
    <script class="jsbin" src="https://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>

    <div class="container">
        <h1 style="text-align: center">File Share Platform developed in Dart</h1>
        <form class="form" action="/api/upload" method="POST" enctype="multipart/form-data">
            <div class="file-upload-wrapper" data-text="Select your file!">
                <input name="file" type="file" class="file-upload-field" value="">
            </div>
            <input name="message" type="text" class="file-upload-wrapper text-input" placeholder="Message">
            <button type="submit" class="btn"> Share </button>
        </form>
    </div>

    <script>
        \$("form").on("change", ".file-upload-field", function () {
            \$(this).parent(".file-upload-wrapper").attr("data-text", \$(this).val().replace(/.*(\\/|\\\\)/, ''));
        });
    </script>
</body>

</html>

""";
