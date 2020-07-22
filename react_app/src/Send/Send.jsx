import React from 'react';
import {connect} from 'react-redux';
import {send, setName, setEmail, setPhone, clearSendForm} from '../actions/send.js'
import './Send.scss';


class Send extends React.Component {


    constructor(props){
        super(props);
        this.props.clearSendForm()
    }

    send(e){
        e.preventDefault();
        this.props.send();
    }

    setName(e){
        this.props.setName(e.target.value);
    }

    setEmail(e){
        this.props.setEmail(e.target.value);
    }

    setPhone(e){
        this.props.setPhone(e.target.value);
    }

    renderError(name){

        let errorExist = Object.keys(this.props.errors).length;
        let message = (this.props.errors.hasOwnProperty(name)) ? this.props.errors[name] : null;
        if (Array.isArray(message)) message = message[0];

        return (errorExist && message) ? <p className="err-msg">{message}</p> : null;
    }

    renderFrom(){
        return <form className="send-req" onSubmit={this.send.bind(this)} >
                    <div className="input-groups">
                        <div className="group-phone">
                            <label>Телефон</label>
                            <input type="text" onChange={this.setPhone.bind(this)} value={this.props.phone}/>
                            {this.renderError('phone')}
                        </div>
                        <div className="group-email">
                            <label>Email</label>
                            <input type="text" onChange={this.setEmail.bind(this)} value={this.props.email}/>
                            {this.renderError('email')}
                        </div>
                        <div className="group-name">
                            <label>Как Ваc зовут?</label>
                            <input type="text" onChange={this.setName.bind(this)} value={this.props.name}/>
                            {this.renderError('name')}
                        </div>
                    </div>
                    <button className="btn-send">Отправить</button>
                </form>
    }

    renderRequest(){
        let className = (this.props.sending.status == 1) ? 'success' : 'err';
        return <div className='srv-request'><span className={className}>{this.props.sending.message}</span></div>
    }

    render () {
        return (this.props.sending.status) ? this.renderRequest() : this.renderFrom();
    }
}

function mapStateToProps(reduxState) {
    return {
        modalIsOpen: reduxState.modal.show,
        sending: reduxState.send.data,
        phone: reduxState.send.phone,
        name: reduxState.send.name,
        email: reduxState.send.email,
        errors: reduxState.send.errors,
    }
}
function mapActionToProps(dispatch) {
    return {
        send: () => dispatch(send()),
        setPhone: (value) => dispatch(setPhone(value)),
        setEmail: (value) => dispatch(setEmail(value)),
        setName:(value) => dispatch(setName(value)),
        clearSendForm:() => dispatch(clearSendForm()),
    }
}
export default connect(mapStateToProps, mapActionToProps)(Send);