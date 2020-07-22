import React from 'react';
import './DatePicker.scss'

class DatePicker extends React.Component {

    constructor(props){
        super(props);

        this.state = {
            month:["Январь", "Февраль", "Март", "Апрель", "Май", "Июнь", "Июль", "Август", "Сентябрь", "Октябрь", "Ноябрь", "Декабрь"],
            curMonth: (new Date()).getMonth(),
            year: (new Date()).getFullYear(),
            show: false,
        }
    }

    getNumberMonth(){
        let month = this.state.curMonth + 1;
        month = month + '';
        return (month.length == 1) ? '0' + month : month;
    }

    getDate(date){
        date = date + '';
        return (date.length == 1) ? '0' + date : date;
    }

    open(){
        this.setState({show:true});
    }

    close(){
        this.setState({
            show: false,
        });
    }

    left(){
        if(this.state.curMonth == 0){
            this.setState({
                year: this.state.year - 1,
                curMonth: 11
            });
        }
        else{
            this.setState({
                curMonth: this.state.curMonth - 1
            });
        }
    }

    right(){
        if(this.state.curMonth == 11){
            this.setState({
                year: this.state.year + 1,
                curMonth: 0
            });
        }
        else{
            this.setState({
                curMonth: this.state.curMonth + 1
            });
        }
    }

    setClassName(d){
        let className = 'full';
        if(d && this.props.value == `${d.date}.${d.month}.${d.year}`){
            className = className + ' active';
        }
        return className;
    }

    getColDays(year, month){
        let d1 = new Date(year, month, 1);
        let d2 = new Date(year, month+1, 1);
        let seconds = (d2.getTime() - d1.getTime()) / 1000;
        return seconds / 86400;
    }

    positionDay(year, month, day){
        let d = (new Date(year, month, day)).getDay();
        return (d) ? d-1 : 6;
    }

    getData(year, month, max_d){

        let empty_cell = this.positionDay(year, month, 1);
        let rows = Math.ceil((empty_cell + max_d)/7);
        let day = 1 - empty_cell;

        let data = [];
        for (let i = 1; i <= rows; i++){

            let tr = [];
            for(let j=1; j<=7; j++){

                if(day <= max_d && day > 0){
                    tr.push(day);
                }
                else{
                    tr.push('');
                }
                day++;
            }
            data.push(tr);
        }
        return data;
    }

    renderDays(year, month){
        let data =this.getData(year, month, this.getColDays(year, month));
        let content = [];
        for(let week=0; week < data.length; week++){
             content.push(<tr key={week}>
                 {
                     data[week].map((d, i)=>{
                         let fullDate = {date: this.getDate(d), month: this.getNumberMonth(), year: this.state.year};
                         return (d) ?
                             <td key={d} className={ this.setClassName(fullDate) } onClick={ () => this.props.change(this, fullDate) } >{d}</td>
                             : <td key={i + 'empty'}/>
                    })
                 }
             </tr>)
        }
        return content;
    }

    render(){
        return (
            <div className="group-pic">
                <i className="far fa-calendar-alt icon-cal" aria-hidden="true" onClick={this.open.bind(this)}></i>
                <input id="pic" type="text" disabled={true} className="date-pic" value={this.props.value}/>
                <div className="pic-cal"  style={{display: (this.state.show) ? 'block' : 'none' }}>
                    <div className="pic-head">
                        <div className="pic-close">
                            <i className="fa fa-times" aria-hidden="true" onClick={this.close.bind(this)}></i>
                        </div>

                        <div className="pic-date">
                            <i className="fas fa-angle-double-left left-pic" onClick={this.left.bind(this)}></i>
                            <span className="pic-month">{this.state.month[this.state.curMonth]}</span>
                            <span className="pic-year">{this.state.year}</span>
                            <i className="fas fa-angle-double-right right-pic" onClick={this.right.bind(this)}></i>
                        </div>
                    </div>
                    <table>
                        <thead>
                            <tr>
                                <th>пн</th>
                                <th>вт</th>
                                <th>ср</th>
                                <th>чт</th>
                                <th>пт</th>
                                <th>сб</th>
                                <th>вс</th>
                            </tr>
                        </thead>
                        <tbody>
                            {
                                this.renderDays(this.state.year,this.state.curMonth)
                            }
                        </tbody>
                    </table>
                </div>
            </div>
        )
    }
}

export default DatePicker;