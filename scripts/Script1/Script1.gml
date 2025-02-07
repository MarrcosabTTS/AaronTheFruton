function create_dialog(_messages){
    if(instance_exists(obj_dialog)){
        return;
    }
    var _inst = instance_create_depth(0, 0, 0, obj_dialog);
    _inst.messages = _messages;
    _inst.current_message = 0;
}

char_colors = {
    "Level UP": c_yellow,
    "Juja": c_green,
    "Aaron": c_orange
}

welcome_dialog = [
{
    name: "Juja",
    msg: "Benvido a Carballo, encontrámonos na Coruña fillo da puta."
},
{
    name: "Aaron",
    msg: "Hostia tío no te entiendo una mierda, que dices."
},
{
    name: "Juja",
    msg: "Que tires para dentro manín, que hueles a ovo."
},
{
    name: "Aaron",
    msg: "Joder pero wtf chat cuanto gitano, voy a comerme un mango."
},
]