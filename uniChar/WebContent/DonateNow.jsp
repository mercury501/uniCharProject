<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="styles/styleDonateNow.css">
    <title>Donate Now</title>
</head>
<body>


    <div class="panel">
   <table>

     <tr>
        <td>
            <label for="" class="max-text">INFORMAZIONI PERSONALI</label>
            <hr>
            
        </td>
        
     </tr>
  
     
        <tr>
            <td>
                <label for="" required>Title:</label >
            </td>

            <td>
                <select name="people" id="people">
                    <option value=""></option>
                    <option value="Mr">Mr</option>
                    <option value="Mrs">Mrs</option>
                    <option value="Ms">Ms</option>
                    <option value="Dr">Dr</option>
                    <option value="Sir">Sir</option>   
                </select>
            </td>
        </tr>


        <tr>
            <td>
                <label for="">First Name:</label>
            </td>

            <td>
                <input type="text"required>
            </td>
        </tr>

        <tr>
            <td>
                <label for="">Last Name:</label>
            </td>

            <td>
                <input type="text"required>
            </td>
        </tr>



        <tr>
            <td>
                <label for="">Country:</label>
            </td>

            <td>
                <select name="country" id="country" required>
                    <option value=""></option>
                    <option value="Italy">Italy</option>
                    <option value="United States">United States</option>
                    <option value="United Kingdom">United Kingdom</option>
                    <option value="New Zealand">New Zealand</option>
                    <option value="France">France</option>   
                </select>
            </td>
        </tr>


        <tr>
            <td>
                <label for="">Address lines:</label>
            </td>

            <td>
                <input type="text">
            </td>
        </tr>


        <tr>
            <td>
                <label for="">City:</label>
            </td>

            <td>
                <input type="text" required>
            </td>
        </tr>

        <tr>
            <td>
                <label for="">ZIP:</label>
            </td>

            <td>
                <input type="text" required>
            </td>
        </tr>

        <tr>
            <td>
                <label for="">Phone:</label>
            </td>

            <td>
                <input type="text" required>
            </td>
        </tr>


        <tr>
            <td>
                <label for="">Email:</label>
            </td>

            <td>
                <input type="text" required>
            </td>
        </tr>

        <tr>
            <td>
                <br>
                <label for="" class="max-text">DONATION INFORMATION</label>
                <hr>
                
            </td>
        </tr>

        <tr>
            <td>
                <label for="">Amount:</label>
            </td>

            <td>
                <input type="text">
            </td>
        </tr>

        <tr>
            <td>
                <label for="">Designation:</label>
            </td>

            <td>
                <select name="designation" id="designation">

                    <option value=""></option>
                    <option value="Ukraine">Support for Ukraine</option>
                </select>
            </td>
        </tr>

        
        <tr>
            <td>
                <br>
                <label for="" class="max-text">PAYMENT INFORMATION</label>
                <hr>
                
            </td>
            
         </tr>

         <tr>
            <td>
                <label for="">Cardholder's Name:</label>
            </td>

            <td>
                <input type="text" required>
            </td>
        </tr>

        <tr>
            <td>
                <label for="">Credit Card Number:</label>
            </td>

            <td>
                <input type="text" required>
            </td>
        </tr>

        <tr>
            <td>
                <label for="">Card Type:</label>
            </td>

            <td>
                <select name="card" id="card">
                    <option value=""></option>
                    <option value="visa">Visa</option>
                    <option value="master-card">MasterCard</option>
                    <option value="american-express">American Express</option>
                    <option value="discover">Discover</option>
                </select>
            </td>
        </tr>


        <tr>
            <td>
                <label for="">Card Expiration:</label>
            </td>

            <td>
                <select name="card-expiration-month" id="card-expiration-month">
                    <option value=""></option>
                    <option value="1">1</option>
                    <option value="2">2</option>
                    <option value="3">3</option>
                    <option value="4">4</option>
                    <option value="5">5</option>
                    <option value="6">6</option>
                    <option value="7">7</option>
                    <option value="8">8</option>
                    <option value="9">9</option>
                    <option value="10">10</option>
                    <option value="11">11</option>
                    <option value="12">12</option>
                </select>

                <label for="">/</label>

                <select name="card-expiration-year" id="card-expiration-year">
                    <option value=""></option>
                    <option value="1">2022</option>
                    <option value="2">2023</option>
                    <option value="3">2024</option>
                    <option value="4">2025</option>
                    <option value="5">2026</option>
                    <option value="6">2027</option>
                    <option value="7">2028</option>
                    <option value="8">2029</option>
                    <option value="9">2030</option>
                    <option value="10">2031</option>
                    <option value="11">2032</option>
                    <option value="12">2033</option>
                </select>
            </td>

            
        </tr>

        <tr>
            <td>
                <label for="">Card Security Code:</label>
            </td>
        
            <td>
                <input type="password">
            </td>
         </tr>


        


    
        

   </table>

   <button class="btn">Donate</button>

</div>
</body>
</html>