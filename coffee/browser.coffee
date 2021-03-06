cw.Browser = cw.Modal.extend
    title: 'Open an existing file'

    tagName: 'div'
    id: 'browser'

    render: ->
        cw.Modal.prototype.render.call(this)
        @$('.content')
            .append(JST.browser())
            .append(new cw.FileListView(@entries).el)
        this

    entries: []

    load: ->
        cw.client.readdir('/', (error, entries) =>
            if error
                console.log(error)
                return

            @entries = ({fullname: e} for e in entries)

            @render()
        )

cw.browser = new cw.Browser()
