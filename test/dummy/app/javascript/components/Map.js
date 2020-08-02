import React, { Component, Fragment } from 'react'
import { ComposableMap, ZoomableGroup, Geographies, Geography, Marker, Line } from 'react-simple-maps'
import { scaleSequential, scaleLog, scaleLinear } from 'd3-scale'
import { interpolateMagma } from 'd3-scale-chromatic'
import { PatternLines } from '@vx/pattern'
import { isMobile, isIPad13 } from 'react-device-detect'
import { TinyColor } from '@ctrl/tinycolor'
import { FaShip } from 'react-icons/fa'
import Toggle from 'react-toggle'
import 'react-toggle/style.css'
import maps from 'js-yaml-loader!../../assets/data/maps.yml';
import us_map from 'js-yaml-loader!../../assets/data/us_map.yml';
import transmissions from 'js-yaml-loader!../../assets/data/transmissions.yml';
import coord from 'js-yaml-loader!../../assets/data/transmissions_coord.yml';
import { getDataFromRegion, parseDate } from '../utils/utils'
import * as str from '../utils/strings'
import i18n from 'js-yaml-loader!../../assets/data/i18n.yml';

class Map extends Component {
    state = {
        loaded: false,
        cursor: [ 0, 0 ],
        clicked: false,
        showTransmissions: false,
        usState: null
    }
    componentDidMount() {
              let region = "哥伦比亚"
              this.props.regionToggle(region.split('.'))
          }
    componentDidUpdate(prevProps, prevState) {
        if (this.props.currentMap !== prevProps.currentMap || this.state.usState !== prevState.usState) {
            this.setState({ loaded: false })
            setTimeout(() => {
                this.props.tooltipRebuild()
            }, 100)
        }

        if (this.props.currentMap === str.US_MAP2) {
            const usState = this.props.currentRegion[1]
            if (usState !== this.state.usState) {
                this.setState({ usState })
            }
        }
    }

    handleGeographyClick = (region) => () => {
        console.log(region);
        // no se sabe or que this es undefined 
        //if (!this.state.clicked || region == null) return 

        this.props.regionToggle(region.split('.'))
    }
    
    onZoomEnd = (event, state) => {
        this.props.handleMapZoomChange(state.zoom)
    }

    getConfig = (config, defaultConfig) =>
        config != null ? config.split(',').map((d) => parseInt(d, 10)) : defaultConfig

    getColorScale = (isUsState) => {
        const { data, currentRegion, scale, metric, darkMode } = this.props
        const currentMap = maps[this.props.currentMap]

        const currentScale = scale === 'linear' ? scaleLinear : scaleLog

        let maxCount = currentMap[`maxScale_${metric}`]
        if (isUsState && metric === 'confirmedCount') {
            const stateData = getDataFromRegion(data, currentRegion.slice(0, 2))
            maxCount = Math.max(
                ...Object.keys(stateData)
                    .filter((x) => ![ 'confirmedCount', 'curedCount', 'deadCount', 'ENGLISH' ].includes(x))
                    .map((county) => Math.max(...Object.values(stateData[county][metric])))
            )
        }
        const mapScale = currentScale().domain([ 1, maxCount ]).clamp(true)
        const colorConvert = (x) => (darkMode ? x * 0.95 + 0.05 : 0.95 - x * 0.95)
        const colorScale = scaleSequential((d) => {
            if (!this.state.showTransmissions || this.props.currentMap !== str.WORLD_MAP) {
                const color = new TinyColor(interpolateMagma(colorConvert(mapScale(d))))
                if (!darkMode) return color.toRgbString()

                return color.desaturate(10).toRgbString()
            } else {
                const greyedColor = new TinyColor(interpolateMagma(colorConvert(mapScale(d)))).desaturate(100)
                if (!darkMode) return greyedColor.setAlpha(0.6).toRgbString()

                // make the colors distinguishable from dark background
                return greyedColor.getLuminance() < 0.09
                    ? greyedColor.darken(5).setAlpha(0.9).toRgbString()
                    : greyedColor.lighten(5).setAlpha(0.9).toRgbString()
            }
        })

        return { colorScale, mapScale }
    }

    getStrokeColor = (counts, isUsState) => {
        const { colorScale, mapScale } = this.getColorScale(isUsState)
        const { darkMode } = this.props
        const tinyColor = new TinyColor(colorScale(counts))

        if (!darkMode) {
            return tinyColor.isDark()
                ? colorScale(mapScale.invert(mapScale(counts) - 0.6))
                : colorScale(mapScale.invert(mapScale(counts) + 0.3))
        } else {
            return tinyColor.isDark()
                ? colorScale(mapScale.invert(mapScale(counts) + 0.5))
                : colorScale(mapScale.invert(mapScale(counts) - 0.5))
        }
    }

    render() {
        if (this.props.currentMap === str.TRANSMISSION) return <div />

        const currentMap = maps[this.props.currentMap]
        const { data, metric, date, lang, currentRegion, mapZoom, darkMode } = this.props

        const lang_map = lang !== 'zh'? 'en' : 'zh'
        const isUsState =
            this.props.currentMap === str.US_MAP2 && this.state.usState != null && this.state.usState in us_map
        const center = isUsState
            ? us_map[this.state.usState].center.split(',').map((d) => parseFloat(d))
            : currentMap.center.split(',').map((d) => parseFloat(d))
        const scale = isUsState ? us_map[this.state.usState].scale : currentMap.scale
        const projection = isUsState ? 'geoMercator' : currentMap.projection

        const { colorScale } = this.getColorScale(isUsState)
        const greyStrokeColor = darkMode ? 'var(--primary-color-10)' : 'var(--grey)'

        return (
            <Fragment>
                {this.props.currentMap === str.WORLD_MAP && (
                    <div className="map-transmission-toggle-wrap">
                        <Toggle
                            className="map-transmission-toggle"
                            defaultChecked={this.state.showTransmissions}
                            onChange={() => this.setState({ showTransmissions: !this.state.showTransmissions })}
                            icons={false}
                        />
                        <span>{i18n.TRANSMISSIONS[this.props.lang]}</span>
                    </div>
                )}
                <ComposableMap
                    projection={projection}

                    projectionConfig={{
                        scale: scale,
                        rotate: currentMap.rotate
                            ? currentMap.rotate.split(',').map((x) => parseInt(x, 10))
                            : [ 0, 0, 0 ],
                        parallels: currentMap.parallels
                            ? currentMap.parallels.split(',').map((x) => parseInt(x, 10))
                            : [ 0, 0 ]
                    }}
                >
                    <PatternLines
                        id="lines"
                        height={6}
                        width={6}
                        stroke={greyStrokeColor}
                        strokeWidth={1}
                        background={darkMode ? 'var(--darker-grey)' : '#fff'}
                        orientation={[ 'diagonal' ]}
                    />
                    <PatternLines
                        id="background-lines"
                        height={6}
                        width={6}
                        stroke={darkMode ? '#333' : '#ddd'}
                        strokeWidth={1}
                        background={darkMode ? 'var(--darker-grey)' : '#fff'}
                        orientation={[ 'diagonal' ]}
                    />
                    <ZoomableGroup
                        zoom={mapZoom}
                        onMoveStart={(e, m) => this.setState({ cursor: [ m.x, m.y ], clicked: false })}
                        onMoveEnd={(e, m) => {
                            // click on desktop
                            if (Math.abs(m.x - this.state.cursor[0]) < 1 && Math.abs(m.y - this.state.cursor[1]) < 1)
                                this.setState({ clicked: true })
                        }}
                        onTouchStart={
                            // click on touch screens
                            isMobile || isIPad13 ? () => this.setState({ clicked: true }) : null
                        }
                        center={center}
                        minZoom={0.2}
                        maxZoom={5}
                    >
                        {![ str.WORLD_MAP, str.US_MAP ].includes(this.props.currentMap) && (
                            <Geographies
                                geography={`maps/${this.props.currentMap === str.US_MAP2
                                    ? 'USA'
                                    : this.props.currentMap === str.HONGKONG_MAP ? 'CHN_1' : 'WORLD'}.json`}
                                onMouseEnter={() => {
                                    if (!this.state.loaded) {
                                        this.setState({ loaded: true })
                                        this.props.tooltipRebuild()
                                    }
                                }}
                            >
                                {({ geographies }) =>
                                    geographies.map((geo) => {
                                        let counts = 0
                                        if (geo.properties.REGION != null) {
                                            const region = getDataFromRegion(data, geo.properties.REGION.split('.'))
                                            if (region && region[metric] && region[metric][date])
                                                counts = region[metric][date]
                                        }
                                        const backgroundMap =
                                            this.props.currentMap === str.US_MAP2
                                                ? str.US_MAP
                                                : this.props.currentMap === str.HONGKONG_MAP
                                                  ? str.CHINA_MAP1
                                                  : str.WORLD_MAP
                                        const name = geo.properties[maps[backgroundMap].name_key[lang_map]]
                                        const isCurrentCountryOrState =
                                            backgroundMap === str.WORLD_MAP
                                                ? geo.properties.CHINESE_NAME === currentRegion[0]
                                                : geo.properties.CHINESE_NAME === currentRegion[1]
                                        if (isCurrentCountryOrState) return <div />
                                        if (backgroundMap === str.US_MAP && currentRegion.length === 1) return <div />
                                        return (
                                            <Geography
                                                className="map-geography"
                                                key={geo.rsmKey}
                                                geography={geo}
                                                data-tip={`${name} <span class="plot-tooltip-bold">${counts}</span>`}
                                                style={{
                                                    default: {
                                                        fill: darkMode ? 'var(--darker-grey)' : '#fff',
                                                        stroke: darkMode ? '#333' : '#ddd',
                                                        strokeWidth: 2
                                                    },
                                                    hover: {
                                                        fill: `url("#background-lines") ${darkMode ? '#333' : '#ddd'}`,
                                                        stroke: darkMode ? '#333' : '#ddd',
                                                        strokeWidth: 2,
                                                        cursor: counts > 0 ? 'pointer' : 'default'
                                                    },
                                                    pressed: {
                                                        fill: `url("#background-lines") ${darkMode ? '#333' : '#ddd'}`,
                                                        stroke: darkMode ? '#333' : '#ddd',
                                                        strokeWidth: 2,
                                                        cursor: counts > 0 ? 'pointer' : 'default'
                                                    }
                                                }}
                                                onClick={this.handleGeographyClick(geo.properties.REGION)}
                                            />
                                        )
                                    })}
                            </Geographies>
                        )}
                        <Geographies
                            geography={`maps/${currentMap.filename}`}
                            onMouseEnter={() => {
                                if (!this.state.loaded) {
                                    this.setState({ loaded: true })
                                    this.props.tooltipRebuild()
                                }
                            }}
                        >
                            {({ geographies }) =>
                                geographies.map((geo, i) => {
                                    let counts = 0
                                    if (geo.properties.REGION != null) {
                                        const region = getDataFromRegion(data, geo.properties.REGION.split('.'))
                                        if (region && region[metric] && region[metric][date])
                                            counts = region[metric][date]
                                    }
                                    const name = geo.properties[currentMap.name_key[lang_map]]
                                    let isCurrentRegion =
                                        geo.properties[currentMap.name_key.zh] ===
                                        currentRegion[currentRegion.length - 1]
                                    if (currentMap.parent_key)
                                        isCurrentRegion =
                                            isCurrentRegion &&
                                            geo.properties[currentMap.parent_key] ===
                                                currentRegion[currentRegion.length - 2]

                                    // highlight all cities in the province
                                    let isParentRegion = false
                                    if (currentMap.parent_key) {
                                        isParentRegion =
                                            geo.properties[currentMap.parent_key] ===
                                            currentRegion[currentRegion.length - 1]
                                        if (currentRegion.length >= 3)
                                            isParentRegion =
                                                isParentRegion ||
                                                geo.properties[currentMap.parent_key] ===
                                                    currentRegion[currentRegion.length - 2]
                                        if (
                                            currentRegion.length === 1 ||
                                            currentRegion[currentRegion.length - 1] === str.MAINLAND_CHINA_ZH
                                        )
                                            isParentRegion = true
                                        isParentRegion = isParentRegion || isCurrentRegion
                                    } else {
                                        isParentRegion = true
                                    }

                                    const strokeColor =
                                        counts === 0 ? greyStrokeColor : this.getStrokeColor(counts, isUsState)

                                    // US map
                                    if (this.props.currentMap === str.US_MAP2 && !isParentRegion) return <div />

                                    return (
                                        <Fragment key={`fragment-${geo.rsmKey}`}>
                                            <Geography
                                                key={geo.rsmKey}
                                                className="map-geography"
                                                geography={geo}
                                                data-tip={`${name} <span class="plot-tooltip-bold">${counts}</span>`}
                                                style={{
                                                    default: {
                                                        fill: isCurrentRegion
                                                            ? `url("#highlightLines-${i}") ${greyStrokeColor}`
                                                            : counts > 0 ? colorScale(counts) : 'url("#lines")',
                                                        stroke: strokeColor,
                                                        strokeWidth: isCurrentRegion ? 1 : 0,
                                                        opacity: isParentRegion ? 1 : 0.2
                                                    },
                                                    hover: {
                                                        fill: `url("#highlightLines-${i}") ${greyStrokeColor}`,
                                                        strokeWidth: 1,
                                                        stroke: strokeColor,
                                                        cursor: counts > 0 ? 'pointer' : 'default'
                                                    },
                                                    pressed: {
                                                        fill: `url("#highlightLines-${i}") ${greyStrokeColor}`,
                                                        strokeWidth: 1,
                                                        stroke: strokeColor,
                                                        cursor: counts > 0 ? 'pointer' : 'default'
                                                    }
                                                }}
                                                onClick={this.handleGeographyClick(geo.properties.REGION)}
                                            />
                                            <PatternLines
                                                id={`highlightLines-${i}`}
                                                height={6}
                                                width={6}
                                                stroke={strokeColor}
                                                strokeWidth={1}
                                                background={
                                                    counts !== 0 ? (
                                                        colorScale(counts)
                                                    ) : darkMode ? (
                                                        'var(--darker-grey)'
                                                    ) : (
                                                        '#fff'
                                                    )
                                                }
                                                orientation={[ 'diagonal' ]}
                                            />
                                        </Fragment>
                                    )
                                })}
                        </Geographies>
                        {this.props.currentMap === str.WORLD_MAP &&
                            this.state.showTransmissions &&
                            transmissions
                                .filter((trans) => parseDate(trans.date) <= parseDate(date))
                                .map((trans, i) => {
                                    return (
                                        <Line
                                            keys={`transmission-${i}`}
                                            from={coord[trans.from].split(',').map((c) => parseFloat(c))}
                                            to={coord[trans.to].split(',').map((c) => parseFloat(c))}
                                            stroke={darkMode ? 'rgba(222,73,104,0.9)' : 'rgba(222, 73, 104, 0.5)'}
                                            strokeWidth={1}
                                            strokeLinecap="round"
                                            style={{
                                                pointerEvents: 'none'
                                            }}
                                        />
                                    )
                                })}
                        {[ str.WORLD_MAP, str.CHINA_MAP1, str.CHINA_MAP2 ].includes(this.props.currentMap) && (
                            <Marker key={'wuhan'} coordinates={[ 114.2, 30.3 ]}>
                                <g
                                    fill="none"
                                    stroke="var(--primary-color-4)"
                                    strokeWidth="2"
                                    pointerEvents="none"
                                    strokeLinecap="round"
                                    strokeLinejoin="round"
                                    transform="translate(-12, -24)"
                                >
                                    <circle cx="12" cy="10" r="3" />
                                    <path d="M12 21.7C17.3 17 20 13 20 10a8 8 0 1 0-16 0c0 3 2.7 6.9 8 11.7z" />
                                </g>
                            </Marker>
                        )}
                    </ZoomableGroup>
                </ComposableMap>
            </Fragment>
        )
    }
}

export default Map
