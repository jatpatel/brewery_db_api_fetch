
import * as ko from 'knockout';
import router = require('plugins/router');
import * as Q from 'q';

// services
import * as breweryApi from 'services/breweryDBApi';
import {default as Beer} from 'models/beer';


const DEFAULT_ABV_VALUE = '10';

class dashboard {

    public loading:KnockoutObservable<boolean>;

    private beers:KnockoutObservableArray<Beer>;
    private dtInstance:any;
    private deferredPromise:any;

    public constructor() {
        this.loading = ko.observable(false);
        this.beers = ko.observableArray([]);
    }

    public activate() {
        this.deferredPromise = Q.defer();
        return true;
    }

    public binding() {
        this.loading(true);

        breweryApi.getBeers(DEFAULT_ABV_VALUE).then((data:any[]) => {
            let allBeers = _.map(data, (beerData:any) => {
                return new Beer(beerData);
            });

            // not required at this stage, observable only requires, if we need subscribe to remote search, sort etc...
            this.beers(allBeers);

            this.loading(false);
            this.deferredPromise.resolve(allBeers);
        });
    }

    public compositionComplete(element:HTMLElement) {
        const $dataTableEl = jQuery(element).children('.data-table');

        this.deferredPromise.promise.then((allBeers) => {
            this.dtInstance = $dataTableEl
                .on('order.dt', this.sortDataTable)
                .DataTable({
                    data: allBeers,
                    lengthChange: false,
                    pagingType: 'simple',
                    columns: [
                        {data: null, render: 'id'},
                        {data: null, render: 'name'},
                         {data: null, render: 'displayName'},
                        {data: null, render: 'isOrganic'}
                    ]
                });
        });
    }

    // more beers can be added on change, based on update on observable
    private addBeersToDataTable(allBeers:Beer[]) {
         _.each(allBeers, (aBeer:Beer) => {
            this.dtInstance.row.add(aBeer);
         });

         this.dtInstance.draw();
    }

    // in case, if we need remote sorting ..
    // do api call here.. replace rows with new sets of rows
    private sortDataTable() {
        // sorting of data table
    }
}

export = dashboard;