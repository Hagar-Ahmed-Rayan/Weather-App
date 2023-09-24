String getUrl(String description) {
  String Url ="";

  // Determine the file name based on the description
  if (description==('clear sky'))///////////////////
    Url = 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQKgEk4xj0Ww0qPTOQFwWTdpTV-363B1t__Uw&usqp=CAU';
   else if (description==('broken clouds'))
    Url = 'https://i.ibb.co/GF8d5Rb/cloudy-1.png';
   else if (description==('scattered clouds'))///////////////
    Url = 'https://i.ibb.co/BsfmRxg/rain.png';
  else if (description==('few clouds'))////////////////
    Url = 'https://i.ibb.co/ykr2sMY/few-clouds.png';
  else if (description==('overcast clouds'))
    Url = 'https://i.ibb.co/XxD9QKN/overcast-clouds.png';

 else//
    Url = 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQKgEk4xj0Ww0qPTOQFwWTdpTV-363B1t__Uw&usqp=CAU';

  return Url ;
}
