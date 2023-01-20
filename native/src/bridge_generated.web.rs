use super::*;
// Section: wire functions

#[wasm_bindgen]
pub fn wire_platform(port_: MessagePort) {
    wire_platform_impl(port_)
}

#[wasm_bindgen]
pub fn wire_get_devices(port_: MessagePort) {
    wire_get_devices_impl(port_)
}

#[wasm_bindgen]
pub fn wire_add_number(port_: MessagePort, a: f32, b: f32) {
    wire_add_number_impl(port_, a, b)
}

#[wasm_bindgen]
pub fn wire_create_log_stream(port_: MessagePort) {
    wire_create_log_stream_impl(port_)
}

#[wasm_bindgen]
pub fn wire_rust_set_up(port_: MessagePort) {
    wire_rust_set_up_impl(port_)
}

#[wasm_bindgen]
pub fn wire_rust_release_mode(port_: MessagePort) {
    wire_rust_release_mode_impl(port_)
}

// Section: allocate functions

// Section: related functions

// Section: impl Wire2Api

// Section: impl Wire2Api for JsValue

impl Wire2Api<f32> for JsValue {
    fn wire2api(self) -> f32 {
        self.unchecked_into_f64() as _
    }
}
