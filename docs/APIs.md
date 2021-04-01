## API Documentation

The project supports the following endpoints:

### Hello World API

|               |                                 |
| ------------- | ------------------------------- |
| Endpoint      | `api/hello`                     |
| Type          | GET                             |
| Response Type | TEXT                            |
| Response      | `Hello from File Share Server!` |
|               |                                 |

### Upload API

|               |                                                                                       |
| ------------- | ------------------------------------------------------------------------------------- |
| Endpoint      | `api/upload`                                                                          |
| Type          | POST                                                                                  |
| Content-Type  | multipart/form-data                                                                   |
| BODY          | ``` File: MultiPart attachment, Message: Multipart String ```                         |
| Response Type | JSON                                                                                  |
| Response      | `{ status: 200, message: 'File added successfully!', hash: 'hashcode for the file' }` |
|               |                                                                                       |


### Download API

|               |                                                                                                                           |
| ------------- | ------------------------------------------------------------------------------------------------------------------------- |
| Endpoint      | `api/download`                                                                                                            |
| Type          | POST                                                                                                                      |
| Content-Type  | application/json                                                                                                          |
| BODY          | ``` token: String ```                                                                                                     |
| Response Type | JSON                                                                                                                      |
| Response      | `{ status: 200, message: 'Found & decrypted the file.', body: { 'message': String, 'filename': String, 'url': String } }` |
|               |                                                                                                                           |
