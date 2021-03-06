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

        .tooltip {
            position: relative;
            display: inline-block;
        }

        .tooltip .tooltiptext {
            visibility: hidden;
            width: 140px;
            background-color: #555;
            color: #fff;
            text-align: center;
            border-radius: 6px;
            padding: 5px;
            position: absolute;
            z-index: 1;
            bottom: 150%;
            left: 50%;
            margin-left: -75px;
            opacity: 0;
            transition: opacity 0.3s;
        }

        .tooltip .tooltiptext::after {
            content: "";
            position: absolute;
            top: 100%;
            left: 50%;
            margin-left: -5px;
            border-width: 5px;
            border-style: solid;
            border-color: #555 transparent transparent transparent;
        }

        .tooltip:hover .tooltiptext {
            visibility: visible;
            opacity: 1;
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

        h2,
        p {
            color: #fff;
        }

        .copySlide {
            display: flex;
            flex-direction: row;
        }

        #hashCodeScreen,
        #alreadyHaveScreen {
            display: none;
        }

        #goBack,
        #goBack2,
        #alreadyHave {
            cursor: pointer;
        }
    </style>
</head>

<body>
    <script class="jsbin" src="https://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>

    <div class="container">
        <h1 style="text-align: center">File Share Platform developed in Dart</h1>
        <form class="form">
            <div class="file-upload-wrapper" data-text="Select your file!">
                <input name="file" type="file" class="file-upload-field" value="">
            </div>
            <input name="message" type="text" class="file-upload-wrapper text-input" placeholder="Enter a message...">
            <button type="submit" class="btn"> Share </button>

            <h4 id="alreadyHave"> Already have a hash? Want to download a file? </h2>
        </form>
        <div id="hashCodeScreen" class="form">
            <h2>File added successfully!</h2>
            <p>Copy the hash below & share with the one you want to share the file: </p>
            <div class="copySlide">
                <input type="text" id="myInput" class="file-upload-wrapper text-input" style="flex: 14;"
                    value="tushar" />
                <div class="tooltip">
                    <button onclick="copyFunction()" class="btn" style="line-height: 20px; flex: 1;"
                        onmouseout="outFunc()">
                        <span class="tooltiptext" id="myTooltip">Copy to clipboard</span>
                        Copy text
                    </button>
                </div>
            </div>

            <h2 id="goBack">
                < Go Back</h2>

        </div>

        <div id="alreadyHaveScreen" class="form">
            <p>Paste the hash below to download the file: </p>
            <div class="copySlide">
                <input type="text" id="newHash" class="file-upload-wrapper text-input" style="flex: 14;" value=""
                    placeholder="Enter your token..." />
                <button id="downloadFile" class="btn" style="line-height: 20px; flex: 1;">
                    Download
                </button>

            </div>

            <h2 id="goBack2">
                < Go Back</h2>

        </div>
    </div>

    <script>

        \$("#downloadFile").on("click", function () {
            var xmlhttp = new XMLHttpRequest();
            xmlhttp.open("POST", "http://localhost:4000/api/download", true);
            xmlhttp.setRequestHeader("content-type", "application/json");

            xmlhttp.onreadystatechange = function () {
                if (this.readyState == 4 && this.status == 200) {
                    //Use parse() method to convert JSON string to JSON object
                    var responseJsonObj = JSON.parse(this.responseText);

                    //use response
                    if (responseJsonObj['status'] != 200) return alert(responseJsonObj['message']);

                    alert(responseJsonObj['message'] + '\\nMessage from sender: ' + responseJsonObj['body']['message']);

                    window.location.href = responseJsonObj['body']['url'];
                }
            };

            var jsonData = { "token": \$("#newHash").val() };
            console.log(jsonData);
            xmlhttp.send(JSON.stringify(jsonData));
        });

        \$("#alreadyHave").on("click", function () {
            \$("form").hide();
            \$("#alreadyHaveScreen").show();
        });

        \$("#goBack").on("click", function () {
            console.log("here");
            window.location.reload();
        });
        \$("#goBack2").on("click", function () {
            console.log("here");
            window.location.reload();
        });
        \$('form')
            .submit(function (e) {
                \$.ajax({
                    url: 'http://localhost:4000/api/upload',
                    type: 'POST',
                    data: new FormData(this),
                    processData: false,
                    contentType: false,
                    success: function (data) {
                        if (data['status'] != 200) alert(data['message']);

                        \$("form").hide();
                        \$("#hashCodeScreen").show();
                        \$("#myInput").val(data['hash']);
                    }
                });
                e.preventDefault();
            });

        \$("form").on("change", ".file-upload-field", function () {
            console.log(\$(this).val().replace(/.*(\\/|\\\\)/, ''));
            \$(this).parent(".file-upload-wrapper").attr("data-text", \$(this).val().replace(/.*(\\/|\\\\)/, ''));
        });

        function copyFunction() {
            var copyText = document.getElementById("myInput");
            copyText.select();
            copyText.setSelectionRange(0, 99999);
            document.execCommand("copy");

            var tooltip = document.getElementById("myTooltip");
            tooltip.innerHTML = "Copied to clipboard ";
        }

        function outFunc() {
            var tooltip = document.getElementById("myTooltip");
            tooltip.innerHTML = "Copy to clipboard";
        }
    </script>
</body>

</html>

""";
