import consumer from './consumer';

document.addEventListener('turbolinks:load', () => {
  const room_element = document.querySelector('.channel-name');
  const room_id = room_element.getAttribute('data-room-id');
  const active_channel = document.querySelector('#chatroom-label-' + room_id);
  active_channel.style.backgroundColor = 'rgb(56, 55, 55)';
  active_channel.querySelector('.chatroom-link').style.color = 'white';
  consumer.subscriptions.create(
    {
      channel: 'ChatroomChannel',
      chatroom_id: room_id,
    },
    {
      connected() {
        // Called when the subscription is ready for use on the server
        console.log('connected... room channel' + room_id);
      },

      disconnected() {
        // Called when the subscription has been terminated by the server
      },

      received(data) {
        // Called when there's incoming data on the websocket for this channel
        console.log(data);
        let new_item = $('#message-container').append(data.mod_messages);
      },
    }
  );
});
