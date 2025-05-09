// Essential Audio Player v2.1
'use strict';

var Essential_Audio = (() => {
    var t = true;
    var f = false;
    var n = null;
    var A = {};
    var b = [];
    var c = f;
    var d = f;
    var g = 0;
    var h;
    var i;
    var j;
    var k = f;
    var l;
    var m = f;
    var o;
    var p;
    var q = 50;
    var pa = 'div.essential_audio';
    var pb = 'div:nth-child(1)';
    var pf = 'mousemove';
    var pg = 'touchmove';
    var ph = 'mouseup';
    var pj = 'touchend';
    var pl = (a) => {
        return a.duration
    };
    var pm = (a) => {
        return a.currentTime
    };
    var pn = (a) => {
        return a.buffered
    };
    var po = (e) => {
        if (e.changedTouches) {
            j = pp(e.changedTouches[0].pageX)
        } else {
            j = pp(e.pageX)
        }
    };
    var pp = (x) => {
        return Math.round(x)
    };
    if (document.readyState != 'loading') {
        B()
    } else {
        document.addEventListener('DOMContentLoaded', B)
    };
    var ie = f;
    try {
        var ig = Object.defineProperty({}, 'passive', {
            get: () => {
                ie = t
            }
        });
        document.addEventListener('ig', n, ig);
        document.removeEventListener('ig', n, ig)
    } catch (e) {};

    function B() {
        var ia = document.querySelectorAll(pa);
        ia.forEach((vo, ib) => {
            vo.innerHTML = '<div><div class="off"><!----></div></div><div><div><!----></div></div><div><!----></div>';
            var ic;
            if (vo.hasAttribute('id')) {
                ic = vo.getAttribute('id')
            } else {
                ic = 'EAP_' + (ib + 1);
                vo.setAttribute('id', ic)
            }
            A[ic] = document.createElement('audio');
            var a = A[ic];
            a.id = ic;
            a.za = vo.querySelector(pb).querySelector('div');
            a.zb = a.za.offsetWidth;
            a.zc = vo.querySelector('div:nth-child(3)');
            a.zd = vo.querySelector(pb).offsetWidth - a.zb;
            if (a.zd < 0) {
                a.zd = 0
            }
            a.ze = vo.getAttribute('data-url');
            a.zf = 0;
            a.zg = 0;
            a.zh = f;
            a.zis = 0;
            a.zj = f;
            a.zk = f;
            a.zl = f;
            a.zm = f;
            a.zn = f;
            a.zo = f;
            b[ib] = ic;
            a.crossOrigin = 'anonymous';
            a.preload = 'metadata';
            if (vo.hasAttribute('data-loop')) {
                a.loop = t
            }
            if (vo.hasAttribute('data-scratch')) {
                a.zp = t
            } else {
                a.zp = f
            }
            if (vo.hasAttribute('data-passive')) {
                a.zq = t
            } else {
                a.zq = f
            }
            if (vo.hasAttribute('data-autoplay')) {
                if (g < 1) {
                    g = 1;
                    a.autoplay = t;
                    a.preload = 'auto';
                    c = a;
                    E(a)
                }
            }
            if (vo.hasAttribute('data-preload')) {
                if (!a.autoplay) {
                    a.preload = 'auto';
                    E(a)
                }
            }
            
            a.za.onmousedown = (e) => {
                if (!k) {
                    po(e);
                    window.addEventListener(pf, (e) => {
                        po(e)
                    });
                    Ba(a)
                }
            };
            if (!a.zq) {
                a.za.ontouchstart = (e) => {
                    e.preventDefault();
                    e.stopPropagation();
                    clearTimeout(l);
                    k = t;
                    po(e);
                    window.addEventListener(pg, (e) => {
                        po(e)
                    });
                    Ba(a)
                }
            } else {
                a.za.addEventListener('touchstart', (e) => {
                    e.stopPropagation();
                    clearTimeout(l);
                    k = t;
                    po(e);
                    window.addEventListener(pg, (e) => {
                        po(e)
                    });
                    Ba(a)
                }, ie ? {
                    passive: t
                } : f)
            }
            a.zc.onmousedown = (e) => {
                e.preventDefault();
                e.stopPropagation();
                if (!k) {
                    po(e);
                    window.addEventListener(pf, (e) => {
                        po(e)
                    });
                    Bb(a)
                }
            };
            if (!a.zq) {
                a.zc.ontouchstart = (e) => {
                    e.preventDefault();
                    e.stopPropagation();
                    clearTimeout(l);
                    k = t;
                    po(e);
                    window.addEventListener(pg, (e) => {
                        po(e)
                    });
                    Bb(a)
                }
            } else {
                a.zc.addEventListener('touchstart', (e) => {
                    e.stopPropagation();
                    clearTimeout(l);
                    k = t;
                    po(e);
                    window.addEventListener(pg, (e) => {
                        po(e)
                    });
                    Bb(a)
                }, ie ? {
                    passive: t
                } : f)
            }
        })
    };

    function Ba(a) {
        a.zn = t;
        h = j;
        i = h - (a.za.getBoundingClientRect().left + window.scrollX);
        if (!k) {
            window.addEventListener(pf, Bc)
        } else {
            a.te = setTimeout(function() {
                window.addEventListener(pg, Bc);
                clearTimeout(a.te)
            }, 100)
        }

        function Bc() {
            if (h != j) {
                m = t;
                if (a.zd > 0) {
                    a.za.classList.add('drag')
                }
            }
            if (m && (a.zd > 0)) {
                o = j - (a.za.parentNode.getBoundingClientRect().left + window.scrollX) - i;
                a.zf = Math.min(Math.max(o, 0), a.zd);
                a.za.style.left = a.zf + 'px';
                if (a.zp && a.zl) {
                    V(a);
                    if (a.paused && (pm(a) != pl(a))) {
                        a.play()
                    }
                }
            }
        };
        if (!k) {
            window.addEventListener(ph, Bd)
        } else {
            window.addEventListener(pj, Bd)
        }

        function Bd() {
            clearTimeout(a.te);
            if (!k) {
                window.removeEventListener(pf, Bc);
                window.removeEventListener(pf, (e) => {
                    po(e)
                });
                window.removeEventListener(ph, Bd)
            } else {
                window.removeEventListener(pg, Bc);
                window.removeEventListener(pg, (e) => {
                    po(e)
                });
                window.removeEventListener(pj, Bd)
            }
            if (m) {
                if (pl(a) && (a.zd > 0)) {
                    if (!a.zp || !a.zl) {
                        V(a)
                    }
                    if (a.zl && a.paused && (pm(a) != pl(a))) {
                        a.play()
                    }
                }
                m = f;
                a.za.classList.remove('drag')
            } else {
                if (c.id && (c.id == a.id) && a.zl) {
                    P(a)
                }
                if (!a.zj) {
                    C(a)
                }
            }
            a.zn = f;
            if (k) {
                l = setTimeout(function() {
                    k = f;
                    clearTimeout(l)
                }, 150)
            }
        }
    };

    function Bb(a) {
        if (a.zd > 0) {
            a.zn = t;
            h = j;
            i = Math.floor(a.zb / 2);
            if (!k) {
                window.addEventListener(pf, Bf)
            } else {
                a.te = setTimeout(function() {
                    window.addEventListener(pg, Bf);
                    clearTimeout(a.te)
                }, 100)
            }

            function Bf() {
                m = t;
                a.za.classList.add('drag');
                o = j - a.za.parentNode.getBoundingClientRect().left - i;
                a.zf = Math.min(Math.max(o, 0), a.zd);
                a.za.style.left = a.zf + 'px';
                if (a.zp && a.zl) {
                    V(a);
                    if (a.paused && (pm(a) != pl(a))) {
                        a.play()
                    }
                }
            };
            if (!k) {
                window.addEventListener(ph, Bg)
            } else {
                window.addEventListener(pj, Bg)
            }

            function Bg() {
                clearTimeout(a.te);
                if (!k) {
                    window.removeEventListener(pf, Bf);
                    window.removeEventListener(pf, (e) => {
                        po(e)
                    });
                    window.removeEventListener(ph, Bg)
                } else {
                    window.removeEventListener(pg, Bf);
                    window.removeEventListener(pg, (e) => {
                        po(e)
                    });
                    window.removeEventListener(pj, Bg)
                }
                if (m) {
                    if (pl(a)) {
                        if (!a.zp || a.zl) {
                            V(a)
                        }
                        if (a.zl && a.paused && (pm(a) != pl(a))) {
                            a.play()
                        }
                    }
                    m = f;
                    a.za.classList.remove('drag')
                } else {
                    p = j - a.za.parentNode.getBoundingClientRect().left - i;
                    a.zf = Math.min(Math.max(p, 0), a.zd);
                    a.za.style.left = a.zf + 'px';
                    if (pl(a)) {
                        V(a);
                        if (a.zl) {
                            a.play()
                        }
                    }
                }
                a.zn = f;
                if (k) {
                    l = setTimeout(function() {
                        k = f;
                        clearTimeout(l)
                    }, 150)
                }
            }
        }
    };

    function C(a) {
        if (c) {
            if (a.id == c.id) {
                R();
                return
            } else {
                R()
            }
        }
        c = a;
        if (pl(a)) {
            O(a)
        } else {
            if (!a.zh) {
                E(a)
            }
        }
    };

    function D(a, vn) {
        a.za.setAttribute('class', '');
        a.za.classList.add(vn)
    };

    function E(a) {
        D(a, 'load');
        a.zh = t;
        a.zk = t;
        a.onplay = () => {
            if (!a.zk) {
                clearTimeout(a.td);
                D(a, 'play')
            }
            if (a.id == d.id) {
                c = a;
                d = f;
                a.zl = t;
                if (a.zd > 0) {
                    a.tc = setInterval(Q, q, a)
                }
            }
        };
        a.onplaying = () => {
            clearTimeout(a.td);
            D(a, 'play')
        };
        a.onwaiting = () => {
            a.td = setTimeout(() => {
                D(a, 'load')
            }, 50)
        };
        a.onpause = () => {
            if (!a.zk && !a.zn && !a.ended) {
                D(a, 'off')
            }
            if (a.zl && !a.zk && !a.ended) {
                R()
            }
        };
        a.onended = () => {
            if (a.zd == 0 && !a.loop) {
                R(0)
            }
        };
        a.onseeking = () => {
            if (a.id == d.id) {
                P(a)
            }
        };
        a.onseeked = () => {
            if (a.id == d.id) {
                P(a)
            }
        };
        a.onloadedmetadata = () => {
            a.onloadedmetadata = n;
            J(a)
        };
        a.onprogress = () => {
            a.onprogress = n;
            a.ta = setInterval(U, 500, a);
            a.zo = t
        };
        var va = a.ze.split(',');
        var vb = t;
        for (var i = 0; i < va.length; i++) {
            va[i] = va[i].trim();
            if (va[i] != '') {
                G(a, va[i], (i + 1));
                vb = f
            }
        }
        if (vb) {
            H(a)
        }
    };

    function G(a, file_url, vc) {
        var vd = a.id + '_' + vc;
        a.innerHTML += '<source id="' + vd + '" src="' + file_url + '" crossorigin="anonymous">'
    };

    function H(a) {
        a.zh = f;
        a.zm = f;
        a.zl = f;
        a.zj = t;
        D(a, 'error');
        if (a.id == c.id) {
            c = f
        }
    };

    function J(a) {
        if (a.preload == 'auto') {
            if (/iPad|iPhone|iPod/.test(navigator.userAgent) && !window.MSStream) {
                a.preload = 'metadata'
            }
            var vf = a.play();
            if (vf !== undefined) {
                vf.then(() => {
                    if (a.autoplay) {
                        M(a)
                    } else {
                        K(a)
                    }
                }).catch(error => {
                    K(a)
                })
            }
        }else{
            if (a.readyState > 2) {
                M(a)
            } else {
                V(a);
                if (a.zf == a.zd) {
                    T(a)
                }
                a.tb = setInterval(L, 250, a)
            }
        }
    };
    function K(a) {
        a.pause();
        D(a, 'off');
        a.currentTime = 0;
        a.zf = 0;
        a.zk = f;
        if (a.autoplay && c) {
            if (a.id == c.id) {
                d = c;
                c = f
            }
        }
    };
    
    function L(a) {
        V(a);
        var vg = 0;
        for (var i = 0; i < pn(a).length; i++) {
            if (pn(a).start(pn(a).length - 1 - i) <= pm(a)) {
                vg = pn(a).end(pn(a).length - 1 - i);
                break
            }
        }
        if (vg >= pm(a)) {
            clearInterval(a.tb);
            M(a)
        }
    };
    
    function M(a) {
        a.zh = f;
        a.zk = f;
        if (!a.zl) {
            if (!a.zm) {
                O(a)
            }
        } else {
            R(a)
        }
    };
    
    function O(a) {
        if (pm(a) == pl(a)) {
            T(a)
        }
        V(a);
        d = f;
        a.zl = t;
        if (a.zd > 0) {
            a.tc = setInterval(Q, q, a)
        }
        a.play();
        var vp = setTimeout(function() {
            if (a.zl && a.paused) {
                R()
            }
            clearTimeout(vp)
        }, 25);
        D(a, 'play')
    };
    
    function N(vo) {
        if (!vo) {
            if (d) {
                vo = d.id
            } else {
                vo = b[0]
            }
        }
        var a = A[vo];
        if (!a.zl) {
            C(a)
        }
    };
    
    function Q(a) {
        if (!a.zn) {
            P(a);
            if (pm(a) == pl(a)) {
                if (a.loop) {
                    T(a)
                } else {
                    R(0)
                }
            }
        }
    };
    
    function P(a) {
        a.zf = pp(pm(a) * a.zd / pl(a));
        a.za.style.left = a.zf + 'px'
    };
    
    function R(vm) {
        if (c) {
            clearInterval(c['tc']);
            c.zm = t;
            c.zl = f;
            c.pause();
            D(c, 'off');
            if (vm == 0) {
                T(c)
            } else {
                c.zf = c.za.offsetLeft
            }
            if (!c.zk) {
                d = c
            }
            c = f
        }
    };
    
    function T(a) {
        if (pl(a)) {
            a.currentTime = 0
        }
        a.zf = 0;
        a.za.style.left = 0 + 'px'
    };
    
    function S(vo) {
        if (!vo) {
            if (d) {
                vo = d.id
            } else {
                vo = b[0]
            }
        }
        var a = A[vo];
        T(a)
    };
    
    function U(a) {
        if (pl(a)) {
            var vh;
            if (a.zd == 0) {
                vh = 0
            } else {
                vh = pp(a.zf / a.zd * pl(a) * 100) / 100
            }
            var vi = 0;
            for (var i = 0; i < pn(a).length; i++) {
                if (pn(a).start(pn(a).length - 1 - i) <= vh) {
                    vi = pn(a).end(pn(a).length - 1 - i);
                    break
                }
            }
            a.zg = pp(vi / pl(a) * 100);
            a.za.parentNode.parentNode.querySelector('div:nth-child(2)').querySelector('div').style.width = a.zg + '%';
            if (a.zg == 100) {
                clearInterval(a.ta);
                a.zo = f
            }
        }
    };
    
    function V(a) {
        if (a.zd > 0) {
            a.currentTime = a.zf / a.zd * pl(a)
        }
    };
    
    function W() {
        var vj = document.querySelectorAll(pa);
        vj.forEach((vo) => {
            var vk = vo.getAttribute('id');
            var a = A[vk];
            if (a.zo) {
                clearInterval(a.ta)
            }
            a.zb = a.za.offsetWidth;
            var vl = vo.querySelector(pb).offsetWidth - a.zb;
            if (vl < 0) {
                vl = 0
            }
            if ((a.za.offsetLeft > 0) && (vk != c.id)) {
                a.zf = pp(a.za.offsetLeft / a.zd * vl);
                a.za.style.left = a.zf + 'px'
            }
            a.zd = vl;
            if (pl(a) && !a.zl) {
                V(a)
            }
            if (a.zo) {
                a.ta = setInterval(U, 500, a)
            }
        })
    };
    window.addEventListener('resize', W);
    return {
        init: Be,
        Audio: A,
        Play: N,
        Stop: R,
        Reset: S,
        players: Xa,
        active: Xb,
        last: Xc
    };
    
    function Xa() {
        return b
    }
    
    function Xb() {
        if (c) {
            return c.id
        } else {
            return f
        }
    }
    
    function Xc() {
        if (d) {
            return d.id
        } else {
            return f
        }
    }
    
    function Be() {
        d = f;
        c = f;
        A = {};
        B()
    }
})();