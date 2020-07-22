import React from 'react';
import {connect} from 'react-redux';
import './Modal.scss';
import Slider from "../Slider/Slider.jsx";
import Send from "../Send/Send.jsx";
import {close} from "../actions/modal.js";

class Modal extends React.Component {

    constructor(props){
        super(props);
        this.state = {
            food: {
                'breakfast and lunch': 'Завтрак и обед',
                'breakfast': 'Завтрак',
                'all': 'Все включено',
            },
            slider: {
                active:0,
            }
        }
    }

    setDate(date){
        if (date.length){
            date = date.replace(/[^\d]/g,'.').split('.');
            date = date.reverse().join('.');
        }
        return date;
    }

    setFood(data){
        if(this.state.food.hasOwnProperty(data)){
            return this.state.food[data]
        }
        return '';
    }

    setRating(stars){

        let rating = [];
        for (let i = 1; i <= stars; i++){
            rating.push(<i className="far fa-star" />)
        }
        return rating;
    }

    setIcon(data){
       return (data) ? <i className="fa fa-check" /> : <i className="fa fa-times" />;
    }

    setPrice(tour){

        let price = tour.price.replace(/[^+\d\.]/g, '');
        if(tour.sell){
            price = price - ( price * (tour.sell/100) );
            price = price.toFixed(2)
        }
        return price + ' руб';
    }

    render(){
      return  (this.props.show) ? <React.Fragment>
                                     <div className="modal-backdrop show" />
                                     <div className="modal-container show" >
                                         <div className="modal show" >
                                             <div className="head-container">
                                                 <h3 className="head">{this.props.tour.hotel.name}</h3><span className="close" onClick={this.props.close}><i className="fa fa-times" /></span>
                                             </div>
                                             <Slider tour={this.props.tour} />
                                             <div className="info">
                                                <h4 className="country">{this.props.tour.hotel.country.name} {this.props.tour.hotel.city.name}</h4>
                                                 <div className="description">
                                                     <div className="col-1">
                                                         <div className="item" ><span className="lb">c</span> {this.setDate(this.props.tour.date_s)}</div>
                                                         <div className="item" ><span className="lb">по</span> {this.setDate(this.props.tour.date_e)}</div>
                                                         <div className="item" ><span className="lb">Цена</span> {this.setPrice(this.props.tour)}</div>
                                                         <div className="item stars" ><span className="lb">Рейтинг</span> {this.setRating(this.props.tour.hotel.stars)}</div>
                                                     </div>
                                                     <div className="col-2">
                                                         <div className="item" ><span className="lb">Питание</span> {this.setFood(this.props.tour.food)}</div>
                                                         <div className="item" ><span className="lb">Трансфер</span> {this.setIcon(this.props.tour.transfer)}</div>
                                                         <div className="item" ><span className="lb">Пляж</span> {this.setIcon(this.props.tour.hotel.beach)}</div>
                                                         <div className="item" ><span className="lb">Линия</span> {this.props.tour.hotel.line}</div>
                                                         <div className="item" ><span className="lb">Паркинг</span> {this.setIcon(this.props.tour.hotel.parking)}</div>
                                                         <div className="item" ><span className="lb">Бассейн</span> {this.setIcon(this.props.tour.hotel.spool)}</div>
                                                     </div>
                                                 </div>
                                             </div>
                                             <Send/>
                                         </div>
                                     </div>
                                  </React.Fragment>
                                : null;
    }
}

function mapStateToProps(reduxState) {
    return {
        show: reduxState.modal.show,
        tour: reduxState.modal.tour,
    }
}

function mapActionToProps(dispath) {
    return {
        close: () => dispath(close())
    }
}

export default connect(mapStateToProps,mapActionToProps)(Modal);